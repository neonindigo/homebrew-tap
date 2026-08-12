cask "gpxviewer" do
  version "1.1"
  sha256 "6ee37e7258b59a03cf8f392161306eeccedc72b465347da9c660c170fda7c616"

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
    Launch GPXViewer once to finish registering the Quick Look thumbnail
    extension. If .gpx thumbnails still don't appear in Finder:

      1. Enable GPXViewerQL under System Settings > General >
         Login Items & Extensions > Quick Look
      2. Run: qlmanage -r && qlmanage -r cache
  EOS
end
