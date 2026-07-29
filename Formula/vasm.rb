class Vasm < Formula
  desc "Portable and retargetable assembler"
  homepage "https://github.com/siemens-mobile-hacks/vasm"
  url "https://github.com/siemens-mobile-hacks/vasm.git",
      tag:      "v2.0f",
      revision: "7afae7e828e808ea45a12e6adf13839387d2be99"
  head "https://github.com/siemens-mobile-hacks/vasm.git", branch: "main"

  def install
    cpus = Dir.children("cpus").select do |cpu|
      %w[cpu.c cpu.h].all? { |file| File.file?("cpus/#{cpu}/#{file}") }
    end.sort
    syntaxes = %w[std madmac mot oldstyle]

    cpus.product(syntaxes).each do |cpu, syntax|
      system "make", "CPU=#{cpu}", "SYNTAX=#{syntax}"
      bin.install "vasm#{cpu}_#{syntax}"
    end

    bin.install "vobjdump"
  end

  test do
    system bin/"vasmarm_std", "-v"
  end
end
