class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "1.4.3"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.3/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "99ff3dff16358f73be924ca792faeccfe5e617ca26863a8c158ed7db297b5369"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.3/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "5b978347a41de5a1caf2c1c1c5944210318d37c56f0aae46f370512995aa2cba"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
