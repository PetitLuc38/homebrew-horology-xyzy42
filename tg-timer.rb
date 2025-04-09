class TgTimer < Formula
  desc "A program for timing mechanical watches"
  homepage "https://tg.ciovil.li"
  url "https://github.com/PetitLuc38/tg-XYZY42-6.1/archive/refs/tags/v0.6.1-tpiepho.tar.gz"
  sha256 "3e13d22f42d6565fcf48b3411ea1f7e7bfb97e05b26b418a69efb80430eb9e66"
  head "https://github.com/PetitLuc38/tg-XYZY42-6.1.git", :branch => "master"

  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "gtk+3"
  depends_on "portaudio"
  depends_on "fftw"
  depends_on "gnome-icon-theme"

  def install
    ENV["LIBTOOL"] = "glibtool"
    ENV["LIBTOOLIZE"] = "glibtoolize"
    system "./autogen.sh"
    system "./configure"
    system "make"
    bin.install "tg-timer"
    man1.install "docs/tg-timer"
  end

  test do
    system "man", "tg-timer.1"
  end
end
