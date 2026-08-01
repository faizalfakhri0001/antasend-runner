class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "1.3.3"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.3.3/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "8f12f9cf1e05d057e81f067c3f7027559ac375a514b869b2bf535f68571b8c30"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.3.3/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "99e7ecba24b8c793190458e54c936f8a0e766d8cb0108c17117b6f8b0d7933e2"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
