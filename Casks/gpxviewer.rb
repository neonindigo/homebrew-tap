cask "gpxviewer" do
  version "1.0"
  sha256 "1b2c8229adfad47b6553dfc3a694a48bfc6a6146530b983e05b68868ec3f77d1"

  url "https://github.com/neonindigo/homebrew-tap/releases/download/gpxviewer-v#{version}/GPXViewer-#{version}.zip"
  name "GPXViewer"
  desc "GPX route viewer with Quick Look thumbnails"
  homepage "https://github.com/mikelrob/gpxviewer"

  depends_on macos: :tahoe

  app "GPXViewer.app"

  postflight do
    # Register the app (and its Quick Look extension) with LaunchServices
    # so .gpx files pick up the UTI without waiting for a Finder rescan.
    lsregister = "/System/Library/Frameworks/CoreServices.framework/Frameworks/" \
                 "LaunchServices.framework/Support/lsregister"
    system_command lsregister, args: ["-f", "#{appdir}/GPXViewer.app"]
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
