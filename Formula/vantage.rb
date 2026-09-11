class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.5.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.10/vantage_0.5.10_darwin_arm64.tar.gz"
      sha256 "131e8b91a7b6d6414fdb44662611dac655ea7117d00f342f5706105fee91182e"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.10/vantage_0.5.10_darwin_amd64.tar.gz"
      sha256 "f9f5af54973f01d4badbadf91943c758a5f383f3d7c3d9f94b56492ea2625e1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.10/vantage_0.5.10_linux_arm64.tar.gz"
      sha256 "6d31dc43bd6c00c7b4edbf307a0eb6a12ea10caa42560824e3da730d393a4355"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.10/vantage_0.5.10_linux_amd64.tar.gz"
      sha256 "225921cb06941f10946134c202be7a8465b3643f395476ce3dc47511433a7db2"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.5.10", shell_output("#{bin}/vantage-check --version")
  end
end
