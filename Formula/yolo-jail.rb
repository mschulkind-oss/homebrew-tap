class YoloJail < Formula
  desc "Declarative agentic development environments, from a sealed jail to your host"
  homepage "https://github.com/mschulkind-oss/yolo-jail"
  url "https://github.com/mschulkind-oss/yolo-jail/archive/refs/tags/v0.15.0.tar.gz"
  sha256 "b4a32ee185d57f321b635c670d0376b26921e218de96cea63fb54adfbb329643"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/mschulkind-oss/yolo-jail/internal/version.buildVersion=#{version}+gb01c1110e84b
      -X github.com/mschulkind-oss/yolo-jail/internal/version.GitCommit=b01c1110e84b
    ]
    system "go", "build", *std_go_args(output: bin/"yolo", ldflags: ldflags.join(" ")), "./cmd/yolo"

    # Stage the prebuilt source bundle beside the binary for checkout-less installs.
    with_env("VERSION" => "#{version}+gb01c1110e84b", "COMMIT" => "b01c1110e84b") do
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
    assert_equal "yolo-jail #{version}+gb01c1110e84b", shell_output("#{bin}/yolo --version").strip
  end
end
