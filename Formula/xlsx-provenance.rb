class XlsxProvenance < Formula
  desc "Fingerprint .xlsx files for authorship: Excel vs openpyxl, xlsxwriter and others"
  homepage "https://github.com/jtannahill/xlsx-provenance"
  url "https://github.com/jtannahill/xlsx-provenance/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a3e7aaeb1b206d283436556b017224a1050f41a9b745493cad4b35f3ff68dc35"
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
