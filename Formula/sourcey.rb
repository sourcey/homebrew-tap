class Sourcey < Formula
  desc "Open source documentation engine for OpenAPI, Doxygen, godoc, MCP, and Markdown"
  homepage "https://sourcey.com"
  url "https://registry.npmjs.org/sourcey/-/sourcey-3.7.1.tgz"
  sha256 "40aa1eab0f9b614e3bf5296c7573131bb32eb38deebd1d26fd36dad977efb2fc"
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
