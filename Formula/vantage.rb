class Vantage < Formula
  desc "Beautiful local Markdown viewer with live reload and Git awareness"
  # Installs two binaries: the  server and the  CLI.
  homepage "https://github.com/mschulkind-oss/vantage"
  version "0.5.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.8/vantage_0.5.8_darwin_arm64.tar.gz"
      sha256 "43afa2813084990ea0d59b32fd5f590a02f68125de0efeaee8a0fd607e0180c6"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.8/vantage_0.5.8_darwin_amd64.tar.gz"
      sha256 "6259e2a478700276ca381202cd2991a09d0dc527e039ba5d9e2be73fd4a5b238"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.8/vantage_0.5.8_linux_arm64.tar.gz"
      sha256 "ed2d098aa78fa90cedc616fb9df8e8e27ea0267f1a4d665ac3c06bfa292f5c5c"
    end
    on_intel do
      url "https://github.com/mschulkind-oss/vantage/releases/download/v0.5.8/vantage_0.5.8_linux_amd64.tar.gz"
      sha256 "deec0031d4236400a97e26b50495c8d49a29aed09569ac0710c1176094505f7d"
    end
  end

  def install
    bin.install "vantage"
    bin.install "vantage-check"
  end

  test do
    assert_match "vantage-md, version", shell_output("#{bin}/vantage --version")
    assert_match "vantage-check 0.5.8", shell_output("#{bin}/vantage-check --version")
  end
end
