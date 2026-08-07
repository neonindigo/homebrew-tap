cask "tokenwatch" do
  version "1.0.1"
  sha256 "d8b421f5ed8f76fd8db890d2d39a8482be9873f0ec167759d822d3d8f1158302"

  url "https://github.com/neonindigo/homebrew-tap/releases/download/tokenwatch-v1.0.1/TokenWatch-1.0.1.zip"
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
