class MailCleanup < Formula
  desc "Empty Apple Mail junk and trash across accounts, with sender/subject rules"
  homepage "https://github.com/jtannahill/mail-cleanup"
  url "https://github.com/jtannahill/mail-cleanup/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b8d5b55dd27147422114c4414a4f4cc4f053687a6c2d120f0d946678476f3790"
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
