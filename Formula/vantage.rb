class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.6.0/vantage_0.6.0_darwin_arm64.tar.gz"
      sha256 "b12361eaa2a465a30403256b3c11dc04ba0a6dc64b26e41f03288977e5c744ad"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.6.0/vantage_0.6.0_darwin_amd64.tar.gz"
      sha256 "bd52bc27668205fce5e29460a4d3af75be11a19c4d199eda80941d7e4a0c416a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.6.0/vantage_0.6.0_linux_arm64.tar.gz"
      sha256 "0d99c853a9b587ab328503c11b05c664acf22f9bf1414cd35deb9a7c34d033d7"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.6.0/vantage_0.6.0_linux_amd64.tar.gz"
      sha256 "276da9b3bbfb50d8a5f058ed8365dc9fe57098ae44f78e32bfcf7e6895cd3c56"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.6.0", shell_output("#{bin}/vantage-check --version")
  end
end
