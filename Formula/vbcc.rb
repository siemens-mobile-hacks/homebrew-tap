class Vbcc < Formula
  desc "Portable and retargetable ISO C compiler"
  homepage "https://github.com/siemens-mobile-hacks/vbcc"
  url "https://github.com/siemens-mobile-hacks/vbcc.git",
      tag:      "v0.9i-pre",
      revision: "290b3d4b9e46b4b1a96c49e937c5d83af58d19ef"
  head "https://github.com/siemens-mobile-hacks/vbcc.git", branch: "main"

  depends_on "vasm"
  depends_on "vlink"

  def install
    # These legacy/experimental source modules are incompatible with the
    # current vbcc core and cannot be built from this upstream snapshot.
    unsupported_targets = %w[bi386 dv falco16 fire16 mark messiahtron pm src]
    target_files = %w[machine.c machine.h machine.dt]
    targets = Dir.children("machines").select do |target|
      target_files.all? do |file|
        File.file?("machines/#{target}/#{file}")
      end
    end
    targets.reject! { |target| unsupported_targets.include?(target) }
    targets.sort!

    targets.each do |target|
      system "make", "TARGET=#{target}", "EMUL=yes '' |"
    end

    bin.install Dir["bin/*"].select { |file| File.file?(file) && File.executable?(file) }
  end

  test do
    assert_path_exists bin/"vbccm68k"
  end
end
