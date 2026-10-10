class YoloJail < Formula
  desc "Declarative agentic development environments, from a sealed jail to your host"
  homepage "https://github.com/mschulkind-oss/yolo-jail"
  url "https://github.com/mschulkind-oss/yolo-jail/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "648402952d6d0139c03439a9723a25bcdc88dabd0759b58aecae47f89aa392a2"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/mschulkind-oss/yolo-jail/internal/version.buildVersion=#{version}
    ]
    system "go", "build", *std_go_args(output: bin/"yolo", ldflags: ldflags.join(" ")), "./cmd/yolo"

    # Stage the prebuilt source bundle beside the binary for checkout-less installs.
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
