class Sourcey < Formula
  desc "Open source documentation engine for OpenAPI, Doxygen, godoc, MCP, and Markdown"
  homepage "https://sourcey.com"
  url "https://registry.npmjs.org/sourcey/-/sourcey-3.6.10.tgz"
  sha256 "f6a91124a06a25efb9be989dc022a61a6bed4e9c22a132f4b08b7392b3dee486"
  license "AGPL-3.0-only"

  depends_on "node"

  def install
    system "npm", "pack", "--silent"
    tarball = Dir["sourcey-#{version}.tgz"].first
    odie "npm pack did not produce a tarball" if tarball.nil?
    system "npm", "install", "-g", "--prefix=#{libexec}", "--no-audit", "--no-fund", tarball
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sourcey --version")
  end
end
