class PgRepackAT13 < Formula
  desc "Reorganize tables in PostgreSQL databases with minimal locks"
  homepage ""
  url "https://github.com/reorg/pg_repack/archive/refs/tags/ver_1.5.0.tar.gz"
  sha256 "9a14d6a95bfa29f856aa10538238622c1f351d38eb350b196c06720a878ccc52"
  license "BSD-3-Clause"

  depends_on "postgresql@13"

  bottle do
    root_url "https://github.com/crunchyjoea/homebrew-pg_repack/raw/main/bottle/"
    sha256 arm64_sonoma: "042ad7203223100d98422d2e4581c16bc2ffa09f78f32c4da06806818cbcd24f"
  end

  def postgresql
    Formula["postgresql@13"]
  end

  def install

    system "make", "all"
    mkdir "stage"
    system "make", "install", "DESTDIR=#{buildpath}/stage"
    postgresql_prefix = postgresql.prefix.realpath
    postgresql_stage_path = File.join("stage", postgresql_prefix)
    bin.install (buildpath/postgresql_stage_path/"bin").children

    stage_path = File.join("stage", "opt/homebrew/opt/postgresql@13/")
    lib.install (buildpath/stage_path/"lib").children
    share.install (buildpath/stage_path/"share").children

  end

end
