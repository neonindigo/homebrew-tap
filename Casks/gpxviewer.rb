cask "gpxviewer" do
  version "1.2.1"
  sha256 "9dc41f0e964fef338499ad9b6dc5445863732e2f5050c602960193e40097428b"

  url "https://github.com/neonindigo/homebrew-tap/releases/download/routebuddy-v#{version}/RouteBuddy-#{version}.zip"
  name "RouteBuddy"
  desc "Legacy GPXViewer cask transitioning to RouteBuddy"
  homepage "https://github.com/mikelrob/gpxviewer"

  conflicts_with cask: "routebuddy"
  depends_on macos: :tahoe

  app "RouteBuddy.app"

  zap trash: [
    "~/Library/Containers/com.neonindigo.RouteBuddy",
    "~/Library/Containers/com.neonindigo.RouteBuddy.RouteBuddyQL",
    "~/Library/Containers/com.neonindigo.test.GPXViewer",
    "~/Library/Containers/com.neonindigo.test.GPXViewer.GPXViewerQL",
    "~/Library/Saved Application State/com.neonindigo.RouteBuddy.savedState",
    "~/Library/Saved Application State/com.neonindigo.test.GPXViewer.savedState",
  ]

  caveats <<~EOS
    The GPXViewer app has been renamed to RouteBuddy. This transitional cask
    upgrades existing GPXViewer installations without triggering Homebrew's
    cask-token migration bug.

    For a fresh installation, use:
      brew install --cask neonindigo/tap/routebuddy
  EOS
end
