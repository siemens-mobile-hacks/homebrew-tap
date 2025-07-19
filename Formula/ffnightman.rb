class Ffnightman < Formula
  desc "Siemens Mobile phones filesystem extractor"
  homepage "https://github.com/siemens-mobile-hacks/ffnightman"
  url "https://github.com/siemens-mobile-hacks/ffnightman.git", branch: "main"
  version "latest"
  license "MIT"
  head "https://github.com/siemens-mobile-hacks/ffnightman.git", branch: "main"

  livecheck do
    url :head
    strategy :github_latest
  end

  depends_on "cmake" => :build
  depends_on "fmt"
  depends_on "libffshit"
  depends_on "spdlog"

  def install
    system "cmake", "-DCMAKE_BUILD_TYPE=Release", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build", "--config", "Release"
    system "cmake", "--install", "build", "--config", "Release"
  end
end
