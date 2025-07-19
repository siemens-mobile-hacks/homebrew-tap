class Ffnightman < Formula
  version "latest"
  sha256 :no_check

  desc "Siemens Mobile phones filesystem extractor"
  homepage "https://github.com/siemens-mobile-hacks/ffnightman"
  url "https://github.com/siemens-mobile-hacks/ffnightman.git", branch: "main"
  license "MIT"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on "cmake" => :build
  depends_on "fmt" => :build
  depends_on "spdlog" => :build
  depends_on "libffshit" => :build

  def install
    system "cmake", "-DCMAKE_BUILD_TYPE=Release", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build", "--config", "Release"
    system "cmake", "--install", "build", "--config", "Release"
  end
end
