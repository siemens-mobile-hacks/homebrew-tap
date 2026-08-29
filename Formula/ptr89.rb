class Ptr89 < Formula
  desc "Tool for converting .elf to .vkp patches"
  homepage "https://github.com/siemens-mobile-hacks/ptr89"
  url "https://github.com/siemens-mobile-hacks/ptr89.git",
      tag:      "v3.0.1",
      revision: "2e43c256b1fe791d0df30af1f2c274f632e98d4a"
  license "MIT"
  head "https://github.com/siemens-mobile-hacks/ptr89.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "Usage: ptr89", shell_output("#{bin}/ptr89 -h 2>&1", 1)
  end
end
