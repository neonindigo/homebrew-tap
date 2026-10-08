# neonindigo Homebrew Tap

Homebrew tap for neonindigo apps. Binaries are attached as release assets
on this repo; app-version tags are namespaced per app (e.g. `routebuddy-v1.2`).

## Usage

```sh
brew tap neonindigo/tap
```

## Apps

| Cask | Description | Install |
|---|---|---|
| `routebuddy` | GPX route viewer with Quick Look thumbnails | `brew install --cask neonindigo/tap/routebuddy` |
| `tokencount` | Menu bar app showing AI provider quota utilisation at a glance | `brew install --cask neonindigo/tap/tokencount` |

## Migrating GPXViewer to RouteBuddy

Existing `gpxviewer` installations can upgrade through the transitional cask:

```sh
brew update
brew upgrade --cask neonindigo/tap/gpxviewer
```

If Homebrew already migrated the installed token and reports that
`Caskroom/routebuddy/1.1/GPXViewer.app` exists, clear that broken migration
state and install RouteBuddy again:

```sh
brew uninstall --cask --force routebuddy
brew install --cask neonindigo/tap/routebuddy
```
