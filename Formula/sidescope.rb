class Sidescope < Formula
  desc "Native Wayland status column for AI usage, system telemetry, and weather"
  homepage "https://github.com/mschulkind-oss/sidescope"
  version "0.1.0"
  license "Apache-2.0"

  on_linux do
    on_intel do
      url "https://github.com/mschulkind-oss/sidescope/releases/download/v0.1.0/sidescope-v0.1.0-ubuntu24.04-x86_64.tar.gz"
      sha256 "3110b7be037b7ff2449016e600606e86a6d415a86f8bf9709594190ec08faa1c"
    end
  end

  def install
    bin.install "sidescope"
    doc.install "README.md", "LICENSE", "INSTALL.txt"
  end

  def caveats
    <<~EOS
      Sidescope uses your system GTK4 and libadwaita runtime libraries
      (for example: `sudo apt install libgtk-4-1 libadwaita-1-0` on Ubuntu/Debian).

      Install `ai-usagebar` separately for `--live` mode, and `curl` for
      weather and air-quality cards.
    EOS
  end

  test do
    assert_path_exists bin/"sidescope"
    output = shell_output("#{bin}/sidescope --report /nonexistent/report.json 2>&1", 2)
    assert_match "cannot read report", output
  end
end
