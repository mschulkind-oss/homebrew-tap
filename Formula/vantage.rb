class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.5.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.5/vantage_0.5.5_darwin_arm64.tar.gz"
      sha256 "3c741be87e9e35a02a44c4a6eb97f1246f027dda3fe7fa2f4034e9b29d5beab7"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.5/vantage_0.5.5_darwin_amd64.tar.gz"
      sha256 "0582c9c14b42bf52adf1f0daf4c8948b786f17e91aaf66983b321376121e8864"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.5/vantage_0.5.5_linux_arm64.tar.gz"
      sha256 "4d54079f196007941fccdc177fb518dc9f45cd3e3434b6d910e6f94215c44e78"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.5/vantage_0.5.5_linux_amd64.tar.gz"
      sha256 "9b3ea1fb051353ba1739bd1ee237b55285f324e77035b3c89926a87a3ac229e0"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.5.5", shell_output("#{bin}/vantage-check --version")
  end
end
