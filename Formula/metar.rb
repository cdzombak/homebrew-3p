class Metar < Formula
  desc "Command-line METAR weather data tool"
  homepage "https://github.com/RyuKojiro/metar"
  version "2025.09.22.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cdzombak/metar-pkg/releases/download/v2025.09.22.3/metar-v2025.09.22.3-darwin-arm64.tar.gz"
      sha256 "743f0f58fd1129d15538a1e1e061b3b9e8028ece15c5e42fafdfa3f41f96f1d5"
    else
      odie "Intel Macs are not supported. Please use an Apple Silicon Mac."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cdzombak/metar-pkg/releases/download/v2025.09.22.3/metar-v2025.09.22.3-linux-amd64.tar.gz"
      sha256 "57d02561a1b8edfb8954b51e2a7733d457f14960f7ca0508cb42d02e871ceb05"
    end
    on_arm do
      url "https://github.com/cdzombak/metar-pkg/releases/download/v2025.09.22.3/metar-v2025.09.22.3-linux-arm64.tar.gz"
      sha256 "a504b68a19fdb04a731d3adb5eca02c0f73512be7d32f5cf7c59b6b5cebad949"
    end
  end

  depends_on "curl"

  def install
    # Each tarball contains the binary named appropriately for the platform
    # We need to rename it to just "metar" when installing
    if OS.linux?
      if Hardware::CPU.intel?
        bin.install "metar-linux-amd64" => "metar"
      elsif Hardware::CPU.arm?
        bin.install "metar-linux-arm64" => "metar"
      end
    elsif OS.mac?
      if Hardware::CPU.arm?
        bin.install "metar-darwin-arm64" => "metar"
      else
        odie "Intel Macs are not supported. Please use an Apple Silicon Mac."
      end
    end
  end

  test do
    system "#{bin}/metar", "--help"
  end
end
