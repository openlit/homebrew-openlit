class Openlit < Formula
  desc "OpenLIT CLI for coding agent observability"
  homepage "https://github.com/openlit/openlit"
  version "0.0.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/openlit/openlit/releases/download/cli-0.0.1/openlit-darwin-amd64.tar.gz"
      sha256 "0982f99759d1959c97dbc94cfb543132c531a04a23ba633d8a2404178258e493"
    end
    on_arm do
      url "https://github.com/openlit/openlit/releases/download/cli-0.0.1/openlit-darwin-arm64.tar.gz"
      sha256 "28ea048ac1ebac628c93e8744c6b13966a60077fe4d480dc71305cda9fb0caf7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/openlit/openlit/releases/download/cli-0.0.1/openlit-linux-amd64.tar.gz"
      sha256 "e4e6401dbacb9e5d3193baecd9b97a354c7b0a612d1b6c7494ddf349de401b0f"
    end
    on_arm do
      url "https://github.com/openlit/openlit/releases/download/cli-0.0.1/openlit-linux-arm64.tar.gz"
      sha256 "0cb30c26886efacda42ed911180e67c0a6027eb60cc13da815b4d6525fa879cd"
    end
  end

  def install
    if OS.mac?
      arch = Hardware::CPU.arm? ? "arm64" : "amd64"
      bin.install "openlit-darwin-#{arch}" => "openlit"
    else
      arch = Hardware::CPU.arm? ? "arm64" : "amd64"
      bin.install "openlit-linux-#{arch}" => "openlit"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openlit version")
  end
end
