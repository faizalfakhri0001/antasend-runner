class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "1.4.0"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.0/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "e5a6577f24b124f55c95c11c9e34ba41d66669c49a95d7dc700751b61888ce26"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.0/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "fc397cc16fac61ef809b3ea9ab615703cfeaf47cd5e25d6a1fabdeecfe76a5f1"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
