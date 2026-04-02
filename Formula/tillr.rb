class Tillr < Formula
  desc "Human-in-the-loop project management for agentic development"
  homepage "https://github.com/mschulkind-oss/tillr"
  url "https://github.com/mschulkind-oss/tillr/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "8f9aa37ede8c80a8d81772500d9797cc98a60eedf7f5eadf376eac5a7f889bf3"
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
      -X github.com/mschulkind-oss/tillr/internal/version.GitCommit=#{Utils.git_short_head}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/tillr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tillr --version")
  end
end
