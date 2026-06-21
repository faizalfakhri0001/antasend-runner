class ApiPilotTestRunner < Formula
  desc "Local TestPilot browser runner for API Pilot"
  homepage "https://github.com/faizalfakhri0001/api-pilot-runner"
  version "2.2.0"

  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/api-pilot-runner/releases/download/api-pilot-test-runner-v2.2.0/api-pilot-test-runner-mac-arm64.tar.gz"
    sha256 "ae6cf7574b7fd57cd5e6445ac1c744bd6aa1ca3536c71a77cc8ee06eecab4267"
  else
    url "https://github.com/faizalfakhri0001/api-pilot-runner/releases/download/api-pilot-test-runner-v2.2.0/api-pilot-test-runner-mac-amd64.tar.gz"
    sha256 "33f07651576ceeda0033c2cbd8d32bc684a2c38b9df0bdae43665d33fdd9680f"
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
