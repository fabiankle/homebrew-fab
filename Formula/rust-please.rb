
require_relative "../custom_download_strategy"

class RustPlease < Formula
  desc "Please CLI (Rust port)"
  homepage "https://github.com/fabiankle/rust-please"
  url "https://api.github.com/repos/fabiankle/rust-please/zipball/v0.2.18", headers: [
                                                                                      "Accept: application/json",
                                                                                      "Authorization: Bearer #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}"
                                                                                    ]
  sha256 "4ffa3365b0d42669d0ee53d85b549c3dc730b29c42a69b0ea8354721d402cb45"
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
      assert_equal "please-rust 0.2.18\n", shell_output("#{bin}/please --version")
    end
  end
end