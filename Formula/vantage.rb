class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.6.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.6.2/vantage_0.6.2_darwin_arm64.tar.gz"
      sha256 "81b7e61dec86baa75522ce59c0a94720145210c5e00826b4fb0e4bd5d344ecc4"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.6.2/vantage_0.6.2_darwin_amd64.tar.gz"
      sha256 "2d7b22579aa6e57b48383e6dfa9f55b8d8127c39e6040bafe1e6c920bf797922"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.6.2/vantage_0.6.2_linux_arm64.tar.gz"
      sha256 "67dcacf2090df0af783b8c0a066d730be2020fdd5590dacaab63869059a7da12"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.6.2/vantage_0.6.2_linux_amd64.tar.gz"
      sha256 "8633cfefb49c5885b1f2e256e7704e23a624eb6f844df9d7aeb05b57bd73d419"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.6.2", shell_output("#{bin}/vantage-check --version")
  end
end
