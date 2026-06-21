class ApiPilotRunner < Formula
  desc "Local runner agent for API Pilot"
  homepage "https://github.com/faizalfakhri0001/api-pilot-runner"
  version "1.2.0"

  if Hardware::CPU.arm?
    url "https://github.com/faizalfakhri0001/api-pilot-runner/releases/download/api-pilot-runner-v1.2.0/api-pilot-runner-mac-arm64.tar.gz"
    sha256 "99009ec3837cfdc7aa9e714cebdafbbdf58cc3156f968d8af2f45b1e1d2da252"
  else
    url "https://github.com/faizalfakhri0001/api-pilot-runner/releases/download/api-pilot-runner-v1.2.0/api-pilot-runner-mac-amd64.tar.gz"
    sha256 "a4d47a45e68a6e1e369c87dd517f2b531c71789fb201026f4b48af6c204d6e4d"
  end

  def install
    bin.install "api-pilot-runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api-pilot-runner version")
  end
end
