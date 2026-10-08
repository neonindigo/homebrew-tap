cask "routebuddy" do
  version "1.2.1"
  sha256 "9dc41f0e964fef338499ad9b6dc5445863732e2f5050c602960193e40097428b"

  url "https://github.com/neonindigo/homebrew-tap/releases/download/routebuddy-v#{version}/RouteBuddy-#{version}.zip"
  name "RouteBuddy"
  desc "GPX route viewer with Quick Look thumbnails"
  homepage "https://github.com/mikelrob/gpxviewer"

  conflicts_with cask: "gpxviewer"
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
    Launch RouteBuddy once to finish registering the Quick Look thumbnail
    extension. If .gpx thumbnails still don't appear in Finder:

      1. Enable RouteBuddyQL under System Settings > General >
         Login Items & Extensions > Quick Look
      2. Run: qlmanage -r && qlmanage -r cache
  EOS
end
