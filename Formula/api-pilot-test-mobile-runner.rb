class ApiPilotTestMobileRunner < Formula
  desc "Local Appium 3 native mobile runner for API Pilot"
  homepage "https://github.com/faizalfakhri0001/api-pilot-runner"
  version "0.2.4"

  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/api-pilot-runner/releases/download/api-pilot-test-mobile-runner-v0.2.4/api-pilot-test-mobile-runner-0.2.4-mac-arm64.tar.gz"
    sha256 "c70d2c55469744f241ef6311a4bbfeff3bc762b5d1e664932e4e613266c5af79"
  else
    url "https://github.com/faizalfakhri0001/api-pilot-runner/releases/download/api-pilot-test-mobile-runner-v0.2.4/api-pilot-test-mobile-runner-0.2.4-mac-amd64.tar.gz"
    sha256 "e53e3246bf2c8a7a01b1d5707958bf3cefc7f5acc0deab8c3cb3f59ce4453306"
  end

  depends_on "node"

  def install
    libexec.install "api-pilot-test-mobile-runner"
    libexec.install "worker"
    cd libexec/"worker" do
      system "npm", "ci", "--omit=dev"
      system "./node_modules/.bin/appium", "driver", "list", "--installed"
    end
    (bin/"api-pilot-test-mobile-runner").write <<~SH
      #!/bin/bash
      export API_PILOT_APPIUM_PATH="#{libexec}/worker/node_modules/.bin/appium"
      if [ -d "$HOME/Library/Android/sdk/platform-tools" ]; then
        export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
      fi
      if [ -n "$ANDROID_HOME" ] && [ -d "$ANDROID_HOME/platform-tools" ]; then
        export PATH="$ANDROID_HOME/platform-tools:$PATH"
      fi
      if [ -n "$ANDROID_SDK_ROOT" ] && [ -d "$ANDROID_SDK_ROOT/platform-tools" ]; then
        export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"
      fi
      exec "#{libexec}/api-pilot-test-mobile-runner" "$@"
    SH
  end

  def caveats
    <<~EOS
      Appium 3 drivers are pinned inside this formula. Android requires the Android SDK/adb.
      iOS requires macOS, Xcode, WebDriverAgent prerequisites, and an explicit signing policy.

      Pair and verify the runtime before starting:
        api-pilot-test-mobile-runner pair <PAIRING_TOKEN>
        api-pilot-test-mobile-runner doctor --json
        api-pilot-test-mobile-runner start
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-test-mobile-runner version")
    assert_match "uiautomator2", shell_output("#{libexec}/worker/node_modules/.bin/appium driver list --installed")
  end
end
