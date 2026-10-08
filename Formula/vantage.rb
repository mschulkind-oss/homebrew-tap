class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.9.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.9.2/vantage_0.9.2_darwin_arm64.tar.gz"
      sha256 "4876da49e3c93b8650abfa095fe9ede4cf894b3ebfa037346c897e2e132feccd"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.9.2/vantage_0.9.2_darwin_amd64.tar.gz"
      sha256 "b33bff54869d3512c58581c20b7f1bd289756aa6c27e093b1db9f8735f678892"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.9.2/vantage_0.9.2_linux_arm64.tar.gz"
      sha256 "f42f32aca77e46aded0d228278f53625f6e98b7239802d94806ebfa89595b28e"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.9.2/vantage_0.9.2_linux_amd64.tar.gz"
      sha256 "5baaeb2e1bb317c9b1502568f301dcca1fa849fe1db52f07290735dec9fa1850"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.9.2", shell_output("#{bin}/vantage-check --version")
  end
end
