class ApiPilotTestRunner < Formula
  desc "Local TestPilot browser runner for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "2.6.0"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-test-runner-v2.6.0/api-pilot-test-runner-mac-arm64.tar.gz"
    sha256 "baa81f524938989e7bac76f4544e85895e7ecd6445f8e95f76b472721b1fd492"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-test-runner-v2.6.0/api-pilot-test-runner-mac-amd64.tar.gz"
    sha256 "d0698232154202ddbe5f03d79a8bec20c00990f5d65a0fd5540225371975b201"
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
