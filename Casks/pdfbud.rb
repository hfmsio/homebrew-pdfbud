cask "pdfbud" do
  version "0.1.0"
  sha256 "4790c602214cc56d07ab79fa8e6f69ecc9da9ff4ce5ab2ee3288dd87e61848b8"

  url "https://github.com/hfmsio/pdfbud/releases/download/v#{version}/pdfbud-#{version}-arm64.dmg"
  name "pdfbud"
  desc "Redact, edit, view, search and fill PDFs"
  homepage "https://github.com/hfmsio/pdfbud"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "pdfbud.app"

  zap trash: [
    "~/Library/Preferences/io.github.hfmsio.pdfbud.plist",
    "~/Library/Saved Application State/io.github.hfmsio.pdfbud.savedState",
  ]

  caveats <<~EOS
    pdfbud is not signed with an Apple Developer ID yet. If macOS blocks the first launch, run:
      xattr -dr com.apple.quarantine "#{appdir}/pdfbud.app"
  EOS
end
