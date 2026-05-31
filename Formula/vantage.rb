class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.1/vantage_0.5.1_darwin_arm64.tar.gz"
      sha256 "8ea49328ff8b5c6a6b617dc3abead594443f92af04ef2dff7f2db3c9cd399e29"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.1/vantage_0.5.1_darwin_amd64.tar.gz"
      sha256 "fd27575cab7931b1c95a24e7e42ab4551837f187a9bb4e247199ea9d35f0511a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.1/vantage_0.5.1_linux_arm64.tar.gz"
      sha256 "ea9ae8b07d3bdfc88bf64da351d2cee19681fa6b06d5e407283efa09bfe0b7ea"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.1/vantage_0.5.1_linux_amd64.tar.gz"
      sha256 "8ffb2ac7f4c5b009be5043fa69bbd750f85c76d2d9891bfc7263b48b23bc1016"
    end
  end

  def install
    bin.install "vantage"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
  end
end
