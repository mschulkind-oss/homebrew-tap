class Tillr < Formula
  desc "Human-in-the-loop project management for agentic development"
  homepage "https://github.com/mschulkind-oss/tillr"
  url "https://github.com/mschulkind-oss/tillr/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "08df193049dfc4a5ef1a0ecd44a86c9f49f203f28d51b9f6c660d17879168639"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "node" => :build

  def install
    system "npm", "install", "-g", "pnpm"
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
