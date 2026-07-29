class Vasm < Formula
  desc "Portable and retargetable assembler"
  homepage "https://github.com/siemens-mobile-hacks/vasm"
  url "https://github.com/siemens-mobile-hacks/vasm.git",
      tag:      "v2.0f",
      revision: "2516daa63ddd61744dfaae72b829002fb22c2cfe"
  head "https://github.com/siemens-mobile-hacks/vasm.git", branch: "main"

  def install
    cpu_files = %w[cpu.c cpu.h]
    cpus = Dir.children("cpus").select do |cpu|
      cpu_files.all? { |file| File.file?("cpus/#{cpu}/#{file}") }
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
