class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.12.0/vantage_0.12.0_darwin_arm64.tar.gz"
      sha256 "8293c158d5d8475ceb964f500825c3a95c5812458ac6626d8aa0762aeff2f5ae"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.12.0/vantage_0.12.0_darwin_amd64.tar.gz"
      sha256 "cdfcb058594634194903d823d0d23b0c3861f910279526c7d91ae4fcbb21744c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.12.0/vantage_0.12.0_linux_arm64.tar.gz"
      sha256 "3365a40cdb2dfb2e66ba7c7c9b4568ca6abc2304d9ef13f17630e9fba0036a13"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.12.0/vantage_0.12.0_linux_amd64.tar.gz"
      sha256 "9d82256a8f39a3267bd816f860bb8257b002da27d9effe37e83b0b8ab9e59d76"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.12.0", shell_output("#{bin}/vantage-check --version")
  end
end
