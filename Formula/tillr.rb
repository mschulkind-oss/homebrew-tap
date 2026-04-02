class Tillr < Formula
  desc "Human-in-the-loop project management for agentic development"
  homepage "https://github.com/mschulkind-oss/tillr"
  url "https://github.com/mschulkind-oss/tillr/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "1ca8fab457fee30f05bd1d1f8f2ba217e52070cc07437d883c1f52e1e31d83d3"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "pnpm" => :build

  def install
    system "pnpm", "--dir", "web", "install", "--frozen-lockfile"
    system "pnpm", "--dir", "web", "build"

    ldflags = %W[
      -s -w
      -X github.com/mschulkind-oss/tillr/internal/version.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/tillr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tillr --version")
  end
end
