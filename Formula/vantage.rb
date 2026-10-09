class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.10.0/vantage_0.10.0_darwin_arm64.tar.gz"
      sha256 "de6d28a5d8cfedf04ab457781b64b909cbdd627b3da3ab895a564edf36be5953"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.10.0/vantage_0.10.0_darwin_amd64.tar.gz"
      sha256 "9fc651b5d6ae6b63d87c6ddbb62f484876d0931bdde2663d8d19e885e8899003"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.10.0/vantage_0.10.0_linux_arm64.tar.gz"
      sha256 "af25c7bd5f0d34f86a03a7105b75b795917dcd94d2c30fe2fcdc59fd55f3d82b"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.10.0/vantage_0.10.0_linux_amd64.tar.gz"
      sha256 "d0aa8937fe6c6bce5f840126843c880c2f7d63b2f9f9ba4b18117a9ac73129cb"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.10.0", shell_output("#{bin}/vantage-check --version")
  end
end
