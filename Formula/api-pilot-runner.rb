class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "1.3.4"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.3.4/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "085c1929c2892c64c046a7ece6a8d9d44668089009185dca27434b30040403d5"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.3.4/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "db835d56e9349d4f735e4d7370ec2031a239c1dc7f639c63a91c2fa49a3c661d"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
