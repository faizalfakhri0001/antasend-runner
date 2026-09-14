class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "1.5.0"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.5.0/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "7aa0c4a60cfecc01effbfe9162e695171f2d70388e420a48983ef2e478242e92"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.5.0/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "85940e21f5a8f0cd396709415d8337abe2691b7d16c1d16aeb24822b48873c9d"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
