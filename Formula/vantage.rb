class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.5.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.2/vantage_0.5.2_darwin_arm64.tar.gz"
      sha256 "7f98c104cb25ccbf6a0d4548d00277497c3e2d9dcca6f01f1d8f8b621ecbd3b3"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.2/vantage_0.5.2_darwin_amd64.tar.gz"
      sha256 "f4debae5f681660ab454938eca8b9a0347d9152158cce36efd5055a8a82981fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.2/vantage_0.5.2_linux_arm64.tar.gz"
      sha256 "9d0115a32c46a4c29627dd7f2cd6afc82490ec4094682cd3c78b6f177e3a608d"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.2/vantage_0.5.2_linux_amd64.tar.gz"
      sha256 "288b4da5a6c9dab2cbcca5edf0cb5add3d47d40f43dd8d57e00773a35e41144d"
    end
  end

  def install
    bin.install "vantage"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
  end
end
