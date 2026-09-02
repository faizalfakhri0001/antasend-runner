class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "1.4.5"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.5/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "5c42643aed2078863983f9e29fe6ae1d50f4af67f03d660f16c1dd71ca936eca"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.5/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "e361ff7ba7a744f08119e02ce3c84b12d72649e3dbe267709ad28cebcbc09487"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
