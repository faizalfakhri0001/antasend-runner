class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/antasend-runner"
  version "1.3.1"
  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.3.1/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "d483d4124176be4e6d532d65bb41cd5c78474417709d20c82eacf0aedd226884"
  else
    url "https://github.com/faizalfakhri0001/antasend-runner/releases/download/api-pilot-runner-v1.3.1/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "015b99f1b29b5c8441f5d6fd6c8cf5c9f4534d79900b36b9cad391a686fc5792"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
