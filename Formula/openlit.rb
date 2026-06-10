class Openlit < Formula
  desc "OpenLIT CLI for coding agent observability"
  homepage "https://github.com/openlit/openlit"
  version "0.0.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/openlit/openlit/releases/download/cli-0.0.1/openlit-darwin-amd64.tar.gz"
      sha256 "REPLACE_AFTER_FIRST_RELEASE"
    end
    on_arm do
      url "https://github.com/openlit/openlit/releases/download/cli-0.0.1/openlit-darwin-arm64.tar.gz"
      sha256 "REPLACE_AFTER_FIRST_RELEASE"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/openlit/openlit/releases/download/cli-0.0.1/openlit-linux-amd64.tar.gz"
      sha256 "REPLACE_AFTER_FIRST_RELEASE"
    end
    on_arm do
      url "https://github.com/openlit/openlit/releases/download/cli-0.0.1/openlit-linux-arm64.tar.gz"
      sha256 "REPLACE_AFTER_FIRST_RELEASE"
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
