cask "gpxviewer" do
  version "1.2"
  sha256 "b7df322507809387faf8856ff2dd6d2533e6b14a55ea64e34f43fe4edbfffa66"

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
