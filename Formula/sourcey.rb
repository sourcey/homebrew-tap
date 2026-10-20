class Sourcey < Formula
  desc "Open source documentation engine for OpenAPI, Doxygen, godoc, MCP, and Markdown"
  homepage "https://sourcey.com"
  url "https://registry.npmjs.org/sourcey/-/sourcey-3.8.1.tgz"
  sha256 "916fd132f8636739ad6bd9eeaa794baf645a292c08e69ac9071d9d16bfd056ce"
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
