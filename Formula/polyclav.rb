# frozen_string_literal: true

# Maintained by polyclav's .github/workflows/publish.yml -- not
# hand-edited, and not GoReleaser-generated (polyclav doesn't use
# goreleaser; see the workflow header for why it must stay that
# way). Regenerated on every release.
class Polyclav < Formula
  desc "Live-piano host: MIDI keyboard -> soundfont/plugin synthesis -> system audio"
  homepage "https://github.com/mschulkind-oss/polyclav"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mschulkind-oss/polyclav/releases/download/v0.3.2/polyclav-macos-arm64.tar.gz"
      sha256 "73592961a9e4c1285bdfba3382e183862d029c6809fed762476c03573eee7024"

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
      url "https://github.com/mschulkind-oss/polyclav/releases/download/v0.3.2/polyclav-linux-x86_64.tar.gz"
      sha256 "79495f7539acb2cf44716146b7c1280d9d4b5a578e7ebdc6839f6d1cff55b06e"

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
