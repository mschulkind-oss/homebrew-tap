class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.8.1/vantage_0.8.1_darwin_arm64.tar.gz"
      sha256 "9907585971a07bcb33b30b20707c7cd42c5e2363c5da768b981f302075ab0ba4"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.8.1/vantage_0.8.1_darwin_amd64.tar.gz"
      sha256 "87a17387d9f8bc380830502e14f71de44741a9db484a71c0d10331a911e8911b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.8.1/vantage_0.8.1_linux_arm64.tar.gz"
      sha256 "957bfdb494b4e228050b342ef99bd0c241ee46eee044cf312f1c2892d6738710"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.8.1/vantage_0.8.1_linux_amd64.tar.gz"
      sha256 "f2045fdcc718825f233f528aeac268465d3c141b0a38a87f59d2a88e797dbef2"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.8.1", shell_output("#{bin}/vantage-check --version")
  end
end
