class SourceyGodoc < Formula
  desc "Native Go documentation generator for Sourcey"
  homepage "https://sourcey.com"
  version "0.3.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sourcey/sourcey/releases/download/go/sourcey-godoc/v0.3.0/sourcey-godoc_0.3.0_darwin_arm64.tar.gz"
      sha256 "68fb6041608576635dcd272fb185ae100b9bb73d2119bf9b31f6308d04e81dc6"
    else
      url "https://github.com/sourcey/sourcey/releases/download/go/sourcey-godoc/v0.3.0/sourcey-godoc_0.3.0_darwin_amd64.tar.gz"
      sha256 "2ba48c8d5b7dfeb4b9fc5c4a300bf00f83442251a95b7bc1becfd72852dd74ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sourcey/sourcey/releases/download/go/sourcey-godoc/v0.3.0/sourcey-godoc_0.3.0_linux_arm64.tar.gz"
      sha256 "48b198684f16066c01d3c30953baeb72825f1f6d3013ff5206c418544436f2b2"
    else
      url "https://github.com/sourcey/sourcey/releases/download/go/sourcey-godoc/v0.3.0/sourcey-godoc_0.3.0_linux_amd64.tar.gz"
      sha256 "ae5090933b1a5e64e33af7444148c9f851a69cf55f7708bc52d7b0f77f5e9fe3"
    end
  end

  def install
    bin.install "sourcey-godoc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sourcey-godoc --version")
  end
end
