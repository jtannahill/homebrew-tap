class MailCleanup < Formula
  desc "Empty Apple Mail junk and trash across accounts, with sender/subject rules"
  homepage "https://github.com/jtannahill/mail-cleanup"
  url "https://github.com/jtannahill/mail-cleanup/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f28213f3e0af4fcea0ee76bfd8b352dd0be07e52490bb236e1390d6ee0303957"
  license "MIT"

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"mail-cleanup.sh" => "mail-cleanup"
    bin.install_symlink libexec/"install.sh" => "mail-cleanup-setup"
    bin.install_symlink libexec/"uninstall.sh" => "mail-cleanup-uninstall"
  end

  def caveats
    <<~EOS
      The command line works right away:
        mail-cleanup --all --dry-run

      To build the Mail Cleanup app and start the menubar, run:
        mail-cleanup-setup
      It installs to ~/.local/share/mail-cleanup and prints the two macOS
      permissions (Automation, Accessibility) you need to grant once.
    EOS
  end

  test do
    assert_match "Apple Mail cleanup", shell_output("#{bin}/mail-cleanup --help")
  end
end
