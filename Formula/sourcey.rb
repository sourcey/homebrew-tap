class Sourcey < Formula
  desc "Open source documentation engine for OpenAPI, Doxygen, godoc, MCP, and Markdown"
  homepage "https://sourcey.com"
  url "https://registry.npmjs.org/sourcey/-/sourcey-3.6.4.tgz"
  sha256 "de7814ad3491dbd7afa68e4a3fbd457735bbd475e65b648164f7dd94ca4a1a95"
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
