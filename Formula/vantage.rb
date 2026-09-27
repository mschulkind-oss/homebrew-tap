class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.7.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.7.1/vantage_0.7.1_darwin_arm64.tar.gz"
      sha256 "2e7386f10a697ed2a88b4bfc601c3381408e2a98a60431164520ea7c3cf43a73"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.7.1/vantage_0.7.1_darwin_amd64.tar.gz"
      sha256 "56ddde7f7a870c24677116e210995fb19e6b56ba24d42dfba490c67c5c22cd17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.7.1/vantage_0.7.1_linux_arm64.tar.gz"
      sha256 "7dd5c2173e5c310a20e2bd61069c3689d99b2a8eaa64f28d3e353496b65abb9f"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.7.1/vantage_0.7.1_linux_amd64.tar.gz"
      sha256 "d96363830216fa6a27abe4fc2f81150aeac42d8b2cbc4790806b77c3f78f89a8"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.7.1", shell_output("#{bin}/vantage-check --version")
  end
end
