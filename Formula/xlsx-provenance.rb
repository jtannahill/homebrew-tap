class XlsxProvenance < Formula
  desc "Fingerprint .xlsx files for authorship: Excel vs openpyxl, xlsxwriter and others"
  homepage "https://github.com/jtannahill/xlsx-provenance"
  url "https://github.com/jtannahill/xlsx-provenance/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "813058372f78d7c4f0a720c4ad56cf6f11b73e0cab79d42ec445a5a453bda903"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "xlsx_provenance.py"
    (bin/"xlsx-provenance").write <<~EOS
      #!/bin/bash
      exec "#{formula_opt_bin("python@3.13")}/python3.13" "#{libexec}/xlsx_provenance.py" "$@"
    EOS
  end

  test do
    assert_match "Fingerprint .xlsx", shell_output("#{bin}/xlsx-provenance --help")
  end
end
