class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "1.4.1"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.1/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "76e4475f3b60907f16a1c1351d920f125fa0383710077a9cbecb018ab1085109"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.1/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "67e6aac29d75578792d191ec4ec3552c218ffe3f02a89e726f9318308eff2a4b"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
