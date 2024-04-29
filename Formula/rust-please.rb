
require_relative "../custom_download_strategy"

class RustPlease < Formula
  desc "Please CLI (Rust port)"
  homepage "https://github.com/fabiankle/rust-please"
  url "https://api.github.com/repos/fabiankle/rust-please/zipball/v0.2.15", headers: [
                                                                                      "Accept: application/json",
                                                                                      "Authorization: Bearer #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}"
                                                                                    ]
  sha256 "57cf85d4110bba78e3d8ec3a290ac96e379cea2e8833244391e3b0aca4e40ebc"
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
      assert_equal "please-rust 0.2.15\n", shell_output("#{bin}/please --version")
    end
  end
end