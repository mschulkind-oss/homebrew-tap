# frozen_string_literal: true

# Maintained by polyclav's .github/workflows/publish.yml -- not
# hand-edited, and not GoReleaser-generated (polyclav doesn't use
# goreleaser; see the workflow header for why it must stay that
# way). Regenerated on every release.
class Polyclav < Formula
  desc "Live-piano host: MIDI keyboard -> soundfont/plugin synthesis -> system audio"
  homepage "https://github.com/mschulkind-oss/polyclav"
  version "0.1.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mschulkind-oss/polyclav/releases/download/v0.1.8/polyclav-macos-arm64.tar.gz"
      sha256 "6754aa4920e1c3158f05201e19d5575a103c6f6473ec04982f11c6a4f304787a"

      def install
        bin.install "polyclav"
        bin.install "polyclav-components"
      end
    else
      odie "polyclav's Homebrew formula only supports Apple Silicon (arm64) for now."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mschulkind-oss/polyclav/releases/download/v0.1.8/polyclav-linux-x86_64.tar.gz"
      sha256 "cb980bc1de2b0f6cfdcde5ae6af29202490012ba41c16907a77c0b5509d27f66"

      def install
        bin.install "polyclav"
        bin.install "polyclav-components"
      end
    else
      odie "polyclav's Homebrew formula only provides x86_64 Linux binaries for now."
    end
  end

  def caveats
    if OS.mac?
      <<~EOS
        First run needs soundfonts (and SFZ support): run
          polyclav bootstrap
        before starting polyclav for the first time.
      EOS
    else
      <<~EOS
        polyclav plays audio through your Linux distro's libraries,
        which Homebrew does not provide. Without them the binary will
        not start. Install:
          Debian/Ubuntu: sudo apt install pipewire libasound2 liblilv-0-0
          Fedora:        sudo dnf install pipewire alsa-lib lilv
          Arch:          sudo pacman -S pipewire alsa-lib lilv
        The binary also needs glibc >= 2.39 -- on older Debian/Ubuntu
        releases, build from source instead.
        First run also needs soundfonts: run `polyclav bootstrap`.
      EOS
    end
  end

  test do
    system "#{bin}/polyclav", "--version"
  end
end
