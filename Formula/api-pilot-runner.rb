class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "1.4.4"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.4/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "86e3ddfe26d2e60a4ad2d681cbbb84d73a96f3effc2cebfda3eb1c658ca733c3"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.4/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "44e43e23dd5323d7d25b5dac74785fc8a87174a0a432759a7eb2956a9adbaa72"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
