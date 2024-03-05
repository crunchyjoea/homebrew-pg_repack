class PgRepack < Formula
  desc "Reorganize tables in PostgreSQL databases with minimal locks"
  homepage ""
  url "https://github.com/reorg/pg_repack/archive/refs/tags/ver_1.5.0.tar.gz"
  sha256 "9a14d6a95bfa29f856aa10538238622c1f351d38eb350b196c06720a878ccc52"
  license "BSD-3-Clause"

  depends_on "postgresql@16"

  bottle do
    root_url "https://github.com/crunchyjoea/homebrew-pg_repack/raw/main/bottle/"
    sha256 arm64_sonoma: "ae9172845d109c1af4cebf7cd1aeef618921d21837b8859b8d19170c5ee530cd"
  end

  def install
    system "make", "all"
    mkdir "#{HOMEBREW_PREFIX}/Cellar/pg_repack/1.5.0/bin"
    mkdir "#{HOMEBREW_PREFIX}/Cellar/pg_repack/1.5.0/lib"
    #cp "bin/pg_repack", "#{HOMEBREW_PREFIX}/Cellar/pg_repack/1.5.0/bin"
    bin.install "bin/pg_repack"
    lib.install "lib/pg_repack--1.5.0.sql"
    #cp "lib/pg_repack--1.5.0.sql", ""#{HOMEBREW_PREFIX}/Cellar/pg_repack/1.5.0/lib"
    #cp "lib/pg_repack.control", ""#{HOMEBREW_PREFIX}/Cellar/pg_repack/1.5.0/lib"
  end

end
