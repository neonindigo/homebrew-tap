cask "tokenwatch" do
  version "1.0.2"
  sha256 "9abd63186a0c128c583e8e4cb85303705ebca46cb5e68215fd5dd5b9ff0f40de"

  url "https://github.com/neonindigo/homebrew-tap/releases/download/tokenwatch-v1.0.2/TokenWatch-1.0.2.zip"
  name "TokenWatch"
  desc "Menu bar app showing AI provider quota utilisation at a glance"
  homepage "https://github.com/neonindigo/TokenWatch"

  depends_on macos: :tahoe

  app "TokenWatch.app"

  zap trash: [
    "~/Library/Containers/com.neonindigo.TokenWatch",
    "~/Library/Preferences/com.neonindigo.TokenWatch.plist",
    "~/Library/Saved Application State/com.neonindigo.TokenWatch.savedState",
  ]
end
