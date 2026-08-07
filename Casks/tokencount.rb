cask "tokencount" do
  version "1.0.0"
  sha256 "1a4619fc4a1309f18a01cfa4b469b9ab8773435b0d6d49e899eab995b55bd73a"

  url "https://github.com/neonindigo/homebrew-tap/releases/download/tokencount-v#{version}/TokenCount-#{version}.zip"
  name "TokenCount"
  desc "Menu bar app showing AI provider quota utilisation at a glance"
  homepage "https://github.com/neonindigo/TokenWatch"

  depends_on macos: :tahoe

  app "TokenCount.app"

  zap trash: [
    "~/Library/Containers/com.neonindigo.TokenCount",
    "~/Library/Preferences/com.neonindigo.TokenCount.plist",
    "~/Library/Saved Application State/com.neonindigo.TokenCount.savedState",
  ]
end
