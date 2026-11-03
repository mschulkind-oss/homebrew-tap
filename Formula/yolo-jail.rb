class YoloJail < Formula
  desc "Declarative agentic development environments, from a sealed jail to your host"
  homepage "https://github.com/mschulkind-oss/yolo-jail"
  url "https://github.com/mschulkind-oss/yolo-jail/archive/refs/tags/v0.16.0.tar.gz"
  sha256 "b03e61583f07c4be6965210c5eaae62b36a39cab8148864066a8debc9d30374c"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/mschulkind-oss/yolo-jail/internal/version.buildVersion=#{version}+ga95fd217dc46
      -X github.com/mschulkind-oss/yolo-jail/internal/version.GitCommit=a95fd217dc46
    ]
    system "go", "build", *std_go_args(output: bin/"yolo", ldflags: ldflags.join(" ")), "./cmd/yolo"

    # Stage the prebuilt source bundle beside the binary for checkout-less installs.
    with_env("VERSION" => "#{version}+ga95fd217dc46", "COMMIT" => "a95fd217dc46") do
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
    assert_equal "yolo-jail #{version}+ga95fd217dc46", shell_output("#{bin}/yolo --version").strip
  end
end
