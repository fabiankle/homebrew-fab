
require_relative "../custom_download_strategy"

class RustPlease < Formula
  desc "Please CLI (Rust port)"
  homepage "https://github.com/fabiankle/rust-please"
  url "https://github.com/fabiankle/rust-please/archive/refs/tags/0.2.2.zip", :using =>GitHubPrivateRepositoryDownloadStrategy
  sha256 "7ea463a2a580ab5c1794571412d0c76b209aad91eb05fac2f63ad1992e6374bb"
  head "https://github.com/fabiankle/rust-please.git"

  depends_on "rust" => :build
  conflicts_with "please", :because => "this is the rust port"

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/please" => "please"
  end

  test do
    mkdir "repo" do
      system "git", "init"
      assert_equal "please-rust 0.2.2\n", shell_output("#{bin}/please --version")
    end
  end
end