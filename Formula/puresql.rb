class Puresql < Formula
  desc "SQLite compiler for Swift"
  homepage "https://github.com/wickwirew/PureSQL"
  url "https://github.com/wickwirew/PureSQL/archive/refs/tags/0.1.0.tar.gz"
  sha256 "e5fe34b9abca359bfc65b2371e8a8c79bcec398c748b7728186d074316bc24c5"
  license "MIT"
  
  depends_on xcode: ["16.4", :build]

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      ["--static-swift-stdlib"]
    end

    system "swift", "build", *args, "-c", "release", "--product", "PureSQLCLI"
    cp, ".build/release/PureSQLCLI", ".build/release/puresql"
    bin.install ".build/release/puresql"
  end

  test do
    system bin/"puresql", "--help"
  end
end
