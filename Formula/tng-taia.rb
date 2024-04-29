class TngTaia < Formula
 desc "TNG TAIA electron wrapper"
 homepage "https://your-node-app-homepage.com"
 version "0.8.25" # Update this with your application version


 url "https://api.github.com/repos/fabiankle/taia-electron/zipball/v#{version}", headers: [ "Accept: application/json",
                                                                                               "Authorization: Bearer #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}"
                                                                                            ]
 sha256 "f247b38113b712faeb03a7457febb2b3d743b6932b83dfcb977296eb80dad2b1" # Update this with your application's checksum

 depends_on "node"

 def install
   system "npm", "install"
   system "npm", "run", "deploy-mac-arm64"
   app_name = "deploy/TNG-TAIA-darwin-arm64/TNG-TAIA.app"
   app_dir = "#{buildpath}/#{app_name}"
   libexec.install app_dir
   bin.install_symlink "#{libexec}/#{app_name}/Contents/MacOS/#{app_name}" => "tng-taia"
 end

end