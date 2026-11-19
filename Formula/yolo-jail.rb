class YoloJail < Formula
  desc "Declarative agentic development environments, from a sealed jail to your host"
  homepage "https://github.com/mschulkind-oss/yolo-jail"
  url "https://github.com/mschulkind-oss/yolo-jail/archive/refs/tags/v0.19.0.tar.gz"
  sha256 "e0ea50af011cd51a83aa331c6876b1a9d26a900a61affd97e77837e1a9b43323"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/mschulkind-oss/yolo-jail/internal/version.buildVersion=#{version}+gfad5da31d39e
      -X github.com/mschulkind-oss/yolo-jail/internal/version.GitCommit=fad5da31d39e
    ]
    system "go", "build", *std_go_args(output: bin/"yolo", ldflags: ldflags.join(" ")), "./cmd/yolo"

    # Stage the prebuilt source bundle beside the binary for checkout-less installs.
    with_env("VERSION" => "#{version}+gfad5da31d39e", "COMMIT" => "fad5da31d39e") do
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
    assert_equal "yolo-jail #{version}+gfad5da31d39e", shell_output("#{bin}/yolo --version").strip
  end
end
