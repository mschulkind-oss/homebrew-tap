class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.9.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.9.1/vantage_0.9.1_darwin_arm64.tar.gz"
      sha256 "bd67661638c85b8eea5ee40e06173b2096685ce4e8d97fda9a664ef75f82c3e7"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.9.1/vantage_0.9.1_darwin_amd64.tar.gz"
      sha256 "3a4b42febea63b6e0f871e7f146c80826741ba954a988f22828418cbe7569cea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.9.1/vantage_0.9.1_linux_arm64.tar.gz"
      sha256 "25f5faf18d55113b02b0e42e56222f5f2ad232fcd69559ed0fdd50f30fc11ebb"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.9.1/vantage_0.9.1_linux_amd64.tar.gz"
      sha256 "7199f2fb7bfbed94446f85323aaded1322c7ef218b4b3adf67a11e1ea543dae6"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.9.1", shell_output("#{bin}/vantage-check --version")
  end
end
