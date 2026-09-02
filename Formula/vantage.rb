class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.5.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.6/vantage_0.5.6_darwin_arm64.tar.gz"
      sha256 "f29db2f18f7f8c0098de1d9dbc7ea1e855f13bff0889759f959dbd92406f8415"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.6/vantage_0.5.6_darwin_amd64.tar.gz"
      sha256 "e8b10836dcf3a003b2159001169e5bab8defc1fab9a99ff23b02ae5d19b9b94f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.6/vantage_0.5.6_linux_arm64.tar.gz"
      sha256 "acaf05b96c2e3f388daab5e055248591cbb774262edaf228b3c7d17f8a3d86d0"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.6/vantage_0.5.6_linux_amd64.tar.gz"
      sha256 "023c7c0701de891e560ff040217235051b26d9760064666a8b7940dd3318599b"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.5.6", shell_output("#{bin}/vantage-check --version")
  end
end
