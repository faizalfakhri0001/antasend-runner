class ApiPilotTestRunner < Formula
  desc "Local TestPilot browser runner for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "2.5.1"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-test-runner-v2.5.1/api-pilot-test-runner-mac-arm64.tar.gz"
    sha256 "a5250665ad627243d429f08c097cd34aa6e67f85c809b58ac2a9c0975d219598"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-test-runner-v2.5.1/api-pilot-test-runner-mac-amd64.tar.gz"
    sha256 "a20daaee3d82d9d2acb8c79940f52a1ff87dd1da191f02d8dab41c5cadbbe07c"
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
