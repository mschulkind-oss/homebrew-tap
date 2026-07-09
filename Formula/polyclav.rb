# frozen_string_literal: true

# Maintained by polyclav's .github/workflows/publish.yml -- not
# hand-edited, and not GoReleaser-generated (polyclav doesn't use
# goreleaser). Regenerated on every release.
class Polyclav < Formula
  desc "Live-piano host: MIDI keyboard -> soundfont/plugin synthesis -> CoreAudio"
  homepage "https://github.com/mschulkind-oss/polyclav"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mschulkind-oss/polyclav/releases/download/v0.1.4/polyclav-macos-arm64.tar.gz"
      sha256 "5137ff831ed8c3cac809514c528d18ffe088bd800ef9dd7e060197dff79ad589"

      def install
        bin.install "polyclav"
        bin.install "polyclav-components"
      end
    else
      odie "polyclav's Homebrew formula only supports Apple Silicon (arm64) for now."
    end
  end

  def caveats
    <<~EOS
      First run needs soundfonts (and SFZ support): run
        polyclav bootstrap
      before starting polyclav for the first time.
    EOS
  end

  test do
    system "#{bin}/polyclav", "--version"
  end
end
