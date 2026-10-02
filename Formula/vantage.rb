class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.8.0/vantage_0.8.0_darwin_arm64.tar.gz"
      sha256 "1b47565bf084ae598028efad167fb0a0b785d66a0433d766ed99dbefc9dbeea3"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.8.0/vantage_0.8.0_darwin_amd64.tar.gz"
      sha256 "455070621e9df858b4bd5c44bb736a3732f6f736a21d8a0a88c4f1f1c8e55ee4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.8.0/vantage_0.8.0_linux_arm64.tar.gz"
      sha256 "ed32ebb77b4d909c3281243d88c305866db6e19e63e4cb904d7d22f2a4de0882"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.8.0/vantage_0.8.0_linux_amd64.tar.gz"
      sha256 "b861a52408e93710e6f85ae5ece7e7563dd0c51975ba1366e6b22bbb4d11fa30"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.8.0", shell_output("#{bin}/vantage-check --version")
  end
end
