class Vlink < Formula
  desc "Portable linker for multiple file formats"
  homepage "https://github.com/siemens-mobile-hacks/vlink"
  url "https://github.com/siemens-mobile-hacks/vlink.git",
      tag:      "v0.18a",
      revision: "432290dde565f4907ddf9e5ca3f7423b6158437e"
  head "https://github.com/siemens-mobile-hacks/vlink.git", branch: "main"

  def install
    system "make"
    bin.install "vlink"
  end

  test do
    system bin/"vlink", "-h"
  end
end
