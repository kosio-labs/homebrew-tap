cask "poprostu" do
  version "1.7.1"
  sha256 "6a743bc202ad01538ad28bf177ad166db0079c63e0fcd58b0078826d48091f4c"

  url "https://github.com/kosio-labs/poprostu/releases/download/v#{version}/PoProstu-#{version}.dmg"
  name "po prostu"
  desc "Image viewer for fast RAW browsing with colour management"
  homepage "https://github.com/kosio-labs/poprostu"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "PoProstu.app"

  # The app is not signed with a Developer ID, so Gatekeeper refuses it while
  # the quarantine flag is set. Homebrew no longer offers --no-quarantine.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/PoProstu.app"]
  end

  zap trash: [
    "~/Library/Caches/PoProstu",
    "~/Library/Preferences/eu.kosio.poprostu.plist",
    "~/Library/Saved Application State/eu.kosio.poprostu.savedState",
  ]
end
