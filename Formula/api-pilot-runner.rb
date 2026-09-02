class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "1.4.6"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.6/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "1a325ea7e129c1629a0307b4b5b7ecc9c653fc2790c1b71765277287f3dd4064"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.6/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "325c2ef61387cf7c9832338392c2423d90a74510ae90c28cb855fd961b71bb0d"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
