class ApiPilotTestRunner < Formula
  desc "Local TestPilot browser runner for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "2.4.5"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-test-runner-v2.4.5/api-pilot-test-runner-mac-arm64.tar.gz"
    sha256 "8605bbd2cbd00659e5c71120b2062ed741d8fae945a28772bfb3a48a6a6df094"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-test-runner-v2.4.5/api-pilot-test-runner-mac-amd64.tar.gz"
    sha256 "5fa092b327f6f9aa22c514da3b8ef8aada7664e30cff9822ddcc2314f0c30ad8"
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
