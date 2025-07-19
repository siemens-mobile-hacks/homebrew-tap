class Libffshit < Formula
  desc "Siemens Mobile phones filesystem library"
  homepage "https://github.com/siemens-mobile-hacks/libffshit"
  license "MIT"
  url "https://github.com/siemens-mobile-hacks/libffshit.git", branch: "main"

  version "latest"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on "cmake" => :build
  depends_on "fmt" => :build

  def install
    system "cmake", "-DCMAKE_BUILD_TYPE=Release", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build", "--config", "Release"
    system "cmake", "--install", "build", "--config", "Release"
  end
end
