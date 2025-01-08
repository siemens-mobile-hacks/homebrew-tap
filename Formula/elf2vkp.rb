class Elf2vkp < Formula
  desc "Tool for converting .elf to .vkp patches"
  homepage "https://github.com/siemens-mobile-hacks/elf2vkp"
  url "https://github.com/siemens-mobile-hacks/elf2vkp.git",
      tag:      "v1.1.5",
      revision: "bb7798d40b5ec2f8814bfb5a4be9f0a2478b83ed"
  license "MIT"
  head "https://github.com/siemens-mobile-hacks/elf2vkp.git", branch: "main"

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
    assert_match "Usage: elf2vkp", shell_output("#{bin}/elf2vkp -h 2>&1", 1)
  end
end
