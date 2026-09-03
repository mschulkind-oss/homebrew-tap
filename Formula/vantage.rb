class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.5.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.7/vantage_0.5.7_darwin_arm64.tar.gz"
      sha256 "7025496770f1889b9bdfd4f401527e4a06fd4dc668e9fec11f94041269b80ed2"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.7/vantage_0.5.7_darwin_amd64.tar.gz"
      sha256 "a56e2e018d9ea981057e608da6d54a5bac08e9be19acabd386738acc26ed65c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.7/vantage_0.5.7_linux_arm64.tar.gz"
      sha256 "70b95e7b90c2c3939a64bd386b208d81b41ed2ab9558d18c4f1ec9f7d7a410ae"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.7/vantage_0.5.7_linux_amd64.tar.gz"
      sha256 "b3d5c473c81b36e994f613a5f8ea66435b8c206408f212dd3bc97a1df960b63d"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.5.7", shell_output("#{bin}/vantage-check --version")
  end
end
