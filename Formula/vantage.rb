class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.11.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.11.0/vantage_0.11.0_darwin_arm64.tar.gz"
      sha256 "beec282d29dfdf2db4e8f1c584736e05247bdb950483401ec28536afd419512b"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.11.0/vantage_0.11.0_darwin_amd64.tar.gz"
      sha256 "2c57acd047251ac22d7aac4ed6c94a3240085faef1836480d9b59e12c41f4e52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.11.0/vantage_0.11.0_linux_arm64.tar.gz"
      sha256 "cf7781bd4d3ecbad7d4c18acb057d375f6473866a0cae2d68a2d5d2befc4b51f"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.11.0/vantage_0.11.0_linux_amd64.tar.gz"
      sha256 "7dcaeb735c17e58cc47988fcd06a25788264a564af23ca74d9975a286b46d9bd"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.11.0", shell_output("#{bin}/vantage-check --version")
  end
end
