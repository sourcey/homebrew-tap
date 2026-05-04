class SourceyGodoc < Formula
  desc "Native Go documentation generator for Sourcey"
  homepage "https://sourcey.com"
  version "0.2.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sourcey/sourcey/releases/download/go/sourcey-godoc/v0.2.1/sourcey-godoc_0.2.1_darwin_arm64.tar.gz"
      sha256 "e42313c5d64791991500917abd2f673a5b58f0518c6246b178646ff97a2dff73"
    else
      url "https://github.com/sourcey/sourcey/releases/download/go/sourcey-godoc/v0.2.1/sourcey-godoc_0.2.1_darwin_amd64.tar.gz"
      sha256 "e0f321d39717e320c9df820e3869549e8ccd609ed21598df6ad45e701d7131ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sourcey/sourcey/releases/download/go/sourcey-godoc/v0.2.1/sourcey-godoc_0.2.1_linux_arm64.tar.gz"
      sha256 "88eb787123233c48b99b4798d2aa2702b378b61c9a2db5c9627208488ddb1fef"
    else
      url "https://github.com/sourcey/sourcey/releases/download/go/sourcey-godoc/v0.2.1/sourcey-godoc_0.2.1_linux_amd64.tar.gz"
      sha256 "cb602e5e35e756c95fc3b8311109ba5a70e9f74afad1f8b0c8efc0022b683bee"
    end
  end

  def install
    bin.install Dir["sourcey-godoc*/sourcey-godoc"].first => "sourcey-godoc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sourcey-godoc --version")
  end
end
