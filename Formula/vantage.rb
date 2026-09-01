class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.5.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.4/vantage_0.5.4_darwin_arm64.tar.gz"
      sha256 "589bde36b8ab36f24da671d5bce6930a874453e0e2e178bfbc2e7345d01a152f"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.4/vantage_0.5.4_darwin_amd64.tar.gz"
      sha256 "c7550f1306537d3a5962c980fff2dfe7fee314edb80e20aaeaadf519a5f5841a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.4/vantage_0.5.4_linux_arm64.tar.gz"
      sha256 "df5ec8540f8c7c1e3e084aa61d8e25ec4be2500d1b22b7d181873216e6664540"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.4/vantage_0.5.4_linux_amd64.tar.gz"
      sha256 "1f7d3a8f030a39d0e6f43a1549c197a93b375ab7d0a25e064f85ec1417d5b5e4"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.5.4", shell_output("#{bin}/vantage-check --version")
  end
end
