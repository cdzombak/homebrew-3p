class Metar < Formula
  desc "Command-line METAR weather data tool"
  homepage "https://github.com/RyuKojiro/metar"
  version "2025.09.22.2025.09.22"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/cdzombak/metar-pkg/releases/download/v2025.09.22.2025.09.22/metar-v2025.09.22.2025.09.22-darwin-amd64.tar.gz"
      sha256 "415ee1c9151324f50f4fe83e1482e82a214860d9b82234e7fe4c1584b97d7791"
    end
    on_arm do
      url "https://github.com/cdzombak/metar-pkg/releases/download/v2025.09.22.2025.09.22/metar-v2025.09.22.2025.09.22-darwin-arm64.tar.gz"
      sha256 "1d4314be8ae2423b1ab0aa922b8bfc457eb3a637293a565d465c3ff3ca7c3823"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cdzombak/metar-pkg/releases/download/v2025.09.22.2025.09.22/metar-v2025.09.22.2025.09.22-linux-amd64.tar.gz"
      sha256 "415ee1c9151324f50f4fe83e1482e82a214860d9b82234e7fe4c1584b97d7791"
    end
    on_arm do
      url "https://github.com/cdzombak/metar-pkg/releases/download/v2025.09.22.2025.09.22/metar-v2025.09.22.2025.09.22-linux-arm64.tar.gz"
      sha256 "1d4314be8ae2423b1ab0aa922b8bfc457eb3a637293a565d465c3ff3ca7c3823"
    end
  end

  depends_on "curl"

  def install
    # Each tarball contains the binary named metar-linux-{arch}
    # We need to rename it to just "metar" when installing
    if OS.linux?
      if Hardware::CPU.intel?
        bin.install "metar-linux-amd64" => "metar"
      elsif Hardware::CPU.arm?
        bin.install "metar-linux-arm64" => "metar"
      end
    elsif OS.mac?
      if Hardware::CPU.intel?
        bin.install "metar-linux-amd64" => "metar"
      elsif Hardware::CPU.arm?
        bin.install "metar-linux-arm64" => "metar"
      end
    end
  end

  test do
    system "#{bin}/metar", "--help"
  end
end
