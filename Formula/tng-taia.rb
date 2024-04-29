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
#    app_path = "#{buildpath}/#{app_name}"

   prefix.install "#{app_name}"
   bin.install_symlink "#{prefix}/TNG-TAIA.app/Contents/MacOS/TNG-TAIA"
   system "echo $(whoami)"
   system "mv", "#{prefix}/TNG-TAIA.app", "/Users/$USER/Applications/"

#    libexec.install app_path

#     app_dir="#{libexec}/TNG-TAIA.app"
#     bin.install Dir["#{app_name}"]
#    bin.install_symlink app_path
  # Move the app to the user's Applications directory
#    user_applications_path = "#{ENV['HOME']}/Applications"
#    mkdir_p user_applications_path
#    mv app_dir, user_applications_path

#    bin.install Dir["deploy/TNG-TAIA-darwin-arm64/TNG-TAIA.app"]
#    system "codesign", "--remove-signature", "#{bin}/TNG-TAIA.app"
 end

end