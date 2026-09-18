class YoloJail < Formula
  desc "Secure container jail for AI agents — run Claude Code, Copilot, and Gemini in YOLO mode safely"
  homepage "https://github.com/mschulkind-oss/yolo-jail"
  url "https://github.com/mschulkind-oss/yolo-jail/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "f17c0663495e7dcfc60b10e4f3d85cca510318e9d18608c56f9d6fd211af34ab"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/mschulkind-oss/yolo-jail/internal/version.buildVersion=#{version}
    ]
    system "go", "build", *std_go_args(output: bin/"yolo", ldflags: ldflags.join(" ")), "./cmd/yolo"

    # Produce the PREBUILT "two files and a binary" bundle beside the
    # binary so a checkout-less install builds the jail image
    # (nix build .#ociImage) with NO Go toolchain and NO source tree at
    # runtime — the flake's prebuilt short-circuit consumes
    # bin/linux-<arch>. The script cross-compiles both Linux arches
    # (CGO off; needs no C toolchain), stamping the release version so
    # the image binaries self-identify. It writes flake.nix, flake.lock
    # and bin/linux-{amd64,arm64}/ into pkgshare; BundledSourceDir finds
    # it at ../share/yolo-jail relative to bin/yolo. See
    # internal/reporoot + scripts/stage-source-bundle.sh.
    with_env("VERSION" => version.to_s) do
      system "scripts/stage-source-bundle.sh", pkgshare.to_s
    end
  end

  def caveats
    <<~EOS
      The first `yolo` run in a workspace builds or pulls the jail's
      container image (nix), which takes a while; later runs reuse it.
    EOS
  end

  test do
    assert_match "yolo-jail #{version}", shell_output("#{bin}/yolo --version")
  end
end
