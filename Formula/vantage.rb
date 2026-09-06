class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.5.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.9/vantage_0.5.9_darwin_arm64.tar.gz"
      sha256 "5bd1c1d0053b783f15f1b0e7fa027dfdef1378ee750c45e33639b52518fc393d"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.9/vantage_0.5.9_darwin_amd64.tar.gz"
      sha256 "cacbc718e0df63a815ef0b6b81b4437a50bcf4e0d7b490fb95f4fcece9212412"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.9/vantage_0.5.9_linux_arm64.tar.gz"
      sha256 "e868065cf5f8638b6791f890e4dcc20c23f56cefcb929f7308a9ee89ea7ece4f"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.9/vantage_0.5.9_linux_amd64.tar.gz"
      sha256 "246a1fe31dd3a31fab78a353fd67eeca2ef86a2764c78ad408e45856678a626c"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.5.9", shell_output("#{bin}/vantage-check --version")
  end
end
