class YoloJail < Formula
  desc "Declarative agentic development environments, from a sealed jail to your host"
  homepage "https://github.com/mschulkind-oss/yolo-jail"
  url "https://github.com/mschulkind-oss/yolo-jail/archive/refs/tags/v0.18.0.tar.gz"
  sha256 "8a715ef864839cb3420dc31c9a34c0360a10cb530fbc879c9137ed9cbfbaeb6e"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/mschulkind-oss/yolo-jail/internal/version.buildVersion=#{version}+gb1d255ded99d
      -X github.com/mschulkind-oss/yolo-jail/internal/version.GitCommit=b1d255ded99d
    ]
    system "go", "build", *std_go_args(output: bin/"yolo", ldflags: ldflags.join(" ")), "./cmd/yolo"

    # Stage the prebuilt source bundle beside the binary for checkout-less installs.
    with_env("VERSION" => "#{version}+gb1d255ded99d", "COMMIT" => "b1d255ded99d") do
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
    assert_equal "yolo-jail #{version}+gb1d255ded99d", shell_output("#{bin}/yolo --version").strip
  end
end
