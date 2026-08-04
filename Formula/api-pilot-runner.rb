class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "1.4.2"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.2/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "c699260a5696cc853a7789e508fc38cc9a36d70d08d824b5d8718e0e1516d4e9"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.4.2/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "9c7968ceedf8cd17c7b792974afc140c3ebed15f73987a14c9ecbb30048d58ae"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
