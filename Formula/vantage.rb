class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.7.0/vantage_0.7.0_darwin_arm64.tar.gz"
      sha256 "6a2d0fe3885602844e653840b0ead09de0867be20c11a4eb7b61e7b05b13e63e"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.7.0/vantage_0.7.0_darwin_amd64.tar.gz"
      sha256 "6116c9003c3eba0c5895ef4f7e7d343e74dcf03975d11dfb407b57c8b7226ca6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.7.0/vantage_0.7.0_linux_arm64.tar.gz"
      sha256 "41274928096b5c26bed5de335dfa1ffe24d9d3e010f2c6df9c1156ec21e5726e"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.7.0/vantage_0.7.0_linux_amd64.tar.gz"
      sha256 "afeea8ab23bf57947301b393a70b74d503ee2c776ffa4b181c9eda280df90cd1"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.7.0", shell_output("#{bin}/vantage-check --version")
  end
end
