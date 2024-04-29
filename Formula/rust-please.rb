
require_relative "../custom_download_strategy"

class RustPlease < Formula
  desc "Please CLI (Rust port)"
  homepage "https://github.com/fabiankle/rust-please"
  url "https://api.github.com/repos/fabiankle/rust-please/zipball/v0.2.19", headers: [
                                                                                      "Accept: application/json",
                                                                                      "Authorization: Bearer #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}"
                                                                                    ]
  sha256 "c25a8cbbda2e7782835b6867a6a45009e04a1610341d723dc83eeabd3a2c4957"
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
      assert_equal "please-rust 0.2.19\n", shell_output("#{bin}/please --version")
    end
  end
end