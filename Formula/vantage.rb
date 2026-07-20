class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.5.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.3/vantage_0.5.3_darwin_arm64.tar.gz"
      sha256 "1e97404df1d489f0dab4fbf4c0992b73348a97fb554b6c6dff7152bdeb92264e"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.3/vantage_0.5.3_darwin_amd64.tar.gz"
      sha256 "7f87f5977593e07f50ffe5511f534c401a4d2774005473cff1ecf6c71059232a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.3/vantage_0.5.3_linux_arm64.tar.gz"
      sha256 "aba36a9ea41aecbdcb765fc9e34005dcb84138c1b821ad748242c0936ebec811"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.3/vantage_0.5.3_linux_amd64.tar.gz"
      sha256 "508415ec67fa75c6f4932a1b46eeced89bc01e47c39816914e18f5b37c2d008f"
    end
  end

  def install
    bin.install "vantage"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
  end
end
