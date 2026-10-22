class YoloJail < Formula
  desc "Declarative agentic development environments, from a sealed jail to your host"
  homepage "https://github.com/mschulkind-oss/yolo-jail"
  url "https://github.com/mschulkind-oss/yolo-jail/archive/refs/tags/v0.15.1.tar.gz"
  sha256 "19f2994f95c63da4a089ebcbb02f6f0bfa77202a0f01bb8b52c61b47353e5f7e"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/mschulkind-oss/yolo-jail/internal/version.buildVersion=#{version}+gb6b057a06537
      -X github.com/mschulkind-oss/yolo-jail/internal/version.GitCommit=b6b057a06537
    ]
    system "go", "build", *std_go_args(output: bin/"yolo", ldflags: ldflags.join(" ")), "./cmd/yolo"

    # Stage the prebuilt source bundle beside the binary for checkout-less installs.
    with_env("VERSION" => "#{version}+gb6b057a06537", "COMMIT" => "b6b057a06537") do
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
    assert_equal "yolo-jail #{version}+gb6b057a06537", shell_output("#{bin}/yolo --version").strip
  end
end
