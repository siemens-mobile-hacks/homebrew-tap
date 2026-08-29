class Ptr89 < Formula
  desc "Tool for converting .elf to .vkp patches"
  homepage "https://github.com/siemens-mobile-hacks/ptr89"
  url "https://github.com/siemens-mobile-hacks/ptr89.git",
      tag:      "v2.0.2",
      revision: "963690e16853d9c00520e314f7875b3e89698a04"
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
