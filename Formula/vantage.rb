class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.6.1/vantage_0.6.1_darwin_arm64.tar.gz"
      sha256 "d5b395d77874c7bc5866e2a1d1e72d49908ba48801873d4cb33bfce40af764bc"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.6.1/vantage_0.6.1_darwin_amd64.tar.gz"
      sha256 "e54eaa74d576fc8f5fb1cce2a911751a097a86fdc61fe1853ca662471d2e4471"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.6.1/vantage_0.6.1_linux_arm64.tar.gz"
      sha256 "6eca21281142a8d144ea8693e162e799fe652052ab7a19090eaffd4a80f17e36"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.6.1/vantage_0.6.1_linux_amd64.tar.gz"
      sha256 "7b00317039c5f245ab5944956280795921f555e24cfc765d7e93656e3980749c"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.6.1", shell_output("#{bin}/vantage-check --version")
  end
end
