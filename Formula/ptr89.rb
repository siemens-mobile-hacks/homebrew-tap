class Elf2vkp < Formula
  desc "Tool for converting .elf to .vkp patches"
  homepage "https://github.com/siemens-mobile-hacks/ptr89"
  url "https://github.com/siemens-mobile-hacks/ptr89.git",
      tag:      "v1.0.4",
      revision: "fc719581481cf17e3cd21d4745e64530bf44d02d"
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
