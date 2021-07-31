class PqivAT212 < Formula
  desc "Powerful image viewer with minimal UI"
  homepage "https://github.com/phillipberndt/pqiv"
  url "https://github.com/phillipberndt/pqiv/archive/2.12.tar.gz"
  sha256 "1538128c88a70bbad2b83fbde327d83e4df9512a2fb560eaf5eaf1d8df99dbe5"
  license "GPL-3.0"
  revision 3
  head "https://github.com/phillipberndt/pqiv.git"

  depends_on "pkg-config" => :build
  depends_on "gtk+3"
  depends_on "imagemagick"
  depends_on "libarchive"
  depends_on "webp"

  on_linux do
    depends_on "libtiff"
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--without-poppler", "--without-spectre"
    system "make"
    system "make", "pqiv.app"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pqiv --version 2>&1")
  end
end
