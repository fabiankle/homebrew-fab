
require_relative "../custom_download_strategy"

class RustPlease < Formula
  desc "Please CLI (Rust port)"
  homepage "https://github.com/fabiankle/rust-please"
  url "https://api.github.com/repos/fabiankle/rust-please/zipball/v0.2.20", headers: [
                                                                                      "Accept: application/json",
                                                                                      "Authorization: Bearer #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}"
                                                                                    ]
  sha256 "3b18d443754340bd4e15871c18cc47b19bf6a7f238b9e9b188debe1d34f75a56"
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
      assert_equal "please-rust 0.2.20\n", shell_output("#{bin}/please --version")
    end
  end
end