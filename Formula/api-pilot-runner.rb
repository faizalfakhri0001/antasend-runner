class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/api-pilot-runner"
  version "1.0.6"

  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/api-pilot-runner/releases/download/api-pilot-runner-v1.0.6/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "ac69755cd5aaaad59ae3767d8821ec6325b867184113fcdbb5411837e6b9b7f7"
  else
    url "https://github.com/faizalfakhri0001/api-pilot-runner/releases/download/api-pilot-runner-v1.0.6/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "a938773e9e04f5c92887f0e4718e53a413eb71a1e1490fed5f2d46f11d1528a3"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
