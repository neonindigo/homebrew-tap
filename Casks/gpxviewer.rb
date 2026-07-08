cask "gpxviewer" do
  version "1.0"
  sha256 "468e49374daad5e966bc3c2afa7f0d42add29e7642cf2d2fe10572e8e6551138"

  url "https://github.com/neonindigo/homebrew-tap/releases/download/gpxviewer-v#{version}/GPXViewer-#{version}.zip"
  name "GPXViewer"
  desc "GPX route viewer with Quick Look thumbnails"
  homepage "https://github.com/mikelrob/gpxviewer"

  depends_on macos: ">= :tahoe"

  app "GPXViewer.app"

  postflight do
    # Register the app (and its Quick Look extension) with LaunchServices
    # so .gpx files pick up the UTI without waiting for a Finder rescan.
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
                   args: ["-f", "#{appdir}/GPXViewer.app"]
  end

  zap trash: [
    "~/Library/Containers/com.neonindigo.test.GPXViewer",
    "~/Library/Containers/com.neonindigo.test.GPXViewer.GPXViewerQL",
    "~/Library/Saved Application State/com.neonindigo.test.GPXViewer.savedState",
  ]

  caveats <<~EOS
    This build is not notarized: on first launch, right-click GPXViewer.app
    and choose Open to pass Gatekeeper.

    Launch GPXViewer once to finish registering the Quick Look thumbnail
    extension. If .gpx thumbnails still don't appear in Finder:

      1. Enable GPXViewerQL under System Settings > General >
         Login Items & Extensions > Quick Look
      2. Run: qlmanage -r && qlmanage -r cache
  EOS
end
