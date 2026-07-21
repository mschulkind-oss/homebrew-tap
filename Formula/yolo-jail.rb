class YoloJail < Formula
  desc "Secure container jail for AI agents — run Claude Code, Copilot, and Gemini in YOLO mode safely"
  homepage "https://github.com/mschulkind-oss/yolo-jail"
  url "https://github.com/mschulkind-oss/yolo-jail/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "d671a1ef5e7a14d71d90c0f4bc72f7090f12063c1821a866e5c724731a66c6ca"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/mschulkind-oss/yolo-jail/internal/version.buildVersion=#{version}
    ]
    %w[yolo].each do |cmd|
      system "go", "build", *std_go_args(output: bin/cmd, ldflags: ldflags.join(" ")), "./cmd/#{cmd}"
    end

    # Ship the source bundle beside the binary so a checkout-less
    # install can build the jail image (nix build .#ociImage). This is
    # a source-build formula, so the goSrc fileset is right here in the
    # extracted tarball. bundledSourceDir finds it at ../share/yolo-jail
    # relative to bin/yolo. See internal/cli/run/probes.go.
    %w[flake.nix flake.lock go.mod go.sum].each do |f|
      (pkgshare).install f
    end
    %w[vendor cmd internal bundled_loopholes].each do |d|
      (pkgshare).install d
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
