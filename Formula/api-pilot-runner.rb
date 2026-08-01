class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "1.3.2"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.3.2/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "02e4072773779553c4b0f739bbf782a7e20ce4a33c565fcf98a54e7517a79d21"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.3.2/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "2e17c92688f38bb5e410b5e9c17758155c50eb3a6bf7b940a6930ed8fab9c8c9"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
