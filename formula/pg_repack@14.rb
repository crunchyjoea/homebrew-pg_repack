class PgRepackAT14 < Formula
  desc "Reorganize tables in PostgreSQL databases with minimal locks"
  homepage ""
  url "https://github.com/reorg/pg_repack/archive/refs/tags/ver_1.5.0.tar.gz"
  sha256 "9a14d6a95bfa29f856aa10538238622c1f351d38eb350b196c06720a878ccc52"
  license "BSD-3-Clause"

  depends_on "postgresql@14"

  bottle do
    root_url "https://github.com/crunchyjoea/homebrew-pg_repack/raw/main/bottle/"
    sha256 arm64_sonoma: "03d5fe23025731a29dfc85c3f2d46bd610cb806b45faa61da3d9af2abddf1d30"
  end

  def postgresql
    Formula["postgresql@14"]
  end

  def install

    system "make", "all"
    mkdir "stage"
    system "make", "install", "DESTDIR=#{buildpath}/stage"
    postgresql_prefix = postgresql.prefix.realpath
    postgresql_stage_path = File.join("stage", postgresql_prefix)
    bin.install (buildpath/postgresql_stage_path/"bin").children

    stage_path = File.join("stage", HOMEBREW_PREFIX)
    lib.install (buildpath/stage_path/"lib").children
    share.install (buildpath/stage_path/"share").children

  end

end
