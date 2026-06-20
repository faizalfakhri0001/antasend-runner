class ApiPilotTestRunner < Formula
  desc "Local TestPilot browser runner for API Pilot"
  homepage "https://github.com/faizalfakhri0001/api-pilot-runner"
  version "2.1.0"

  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/api-pilot-runner/releases/download/api-pilot-test-runner-v2.1.0/api-pilot-test-runner-mac-arm64.tar.gz"
    sha256 "18913d914892ea7f708131f30ee32b59719aa41207c45a0b235aadc08d5780b9"
  else
    url "https://github.com/faizalfakhri0001/api-pilot-runner/releases/download/api-pilot-test-runner-v2.1.0/api-pilot-test-runner-mac-amd64.tar.gz"
    sha256 "26475ab87df2cff05658769dc0552d418a74773ad84f8fd1c600cf71a32cf55d"
  end

  depends_on "node"

  def install
    bin.install "api-pilot-test-runner"
    libexec.install "worker" => "api-pilot-test-runner"

    cd libexec/"api-pilot-test-runner" do
      system "npm", "ci", "--omit=dev"
      system "npx", "playwright", "install", "chromium"
    end
  end

  def caveats
    <<~EOS
      Pair and start this runner separately from api-pilot-runner:
        api-pilot-test-runner pair <PAIRING_TOKEN>
        api-pilot-test-runner doctor
        api-pilot-test-runner start

      The HTTP collection runner remains available as api-pilot-runner.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-test-runner version")
  end
end
