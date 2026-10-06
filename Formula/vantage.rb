class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.9.0/vantage_0.9.0_darwin_arm64.tar.gz"
      sha256 "08e1d3ed9704e2a6f8293462f307bc9b243baed37a19beaea4444a56ad28bdf4"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.9.0/vantage_0.9.0_darwin_amd64.tar.gz"
      sha256 "f85dd512e032283feaa80fea9b9459f9424d8032540d4dae8bf1af6e62aa715b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.9.0/vantage_0.9.0_linux_arm64.tar.gz"
      sha256 "591fda734dc787c663b1905fd2a6bba36ff86548a8ba9d1788c12e320b9b681b"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.9.0/vantage_0.9.0_linux_amd64.tar.gz"
      sha256 "d6997089e2c26b4ca610e67d73bf4f1102e6a908fc5977905bbca1ae3cb88f24"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.9.0", shell_output("#{bin}/vantage-check --version")
  end
end
