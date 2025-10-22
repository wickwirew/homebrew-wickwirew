class Puresql < Formula
  desc "SQLite compiler for Swift"
  homepage "https://github.com/wickwirew/PureSQL"
  url "https://github.com/wickwirew/PureSQL/archive/refs/tags/0.1.0.tar.gz"
  sha256 "e5fe34b9abca359bfc65b2371e8a8c79bcec398c748b7728186d074316bc24c5"
  license "MIT"

  bottle do
    root_url "https://github.com/wickwirew/homebrew-wickwirew/releases/download/puresql-0.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8bdb4420969905c9846712bbe28ea894e520d8c8966df8ce92da275775f7d05d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "04f904da3adfa46343ea38f28a704621efe5a6b123e1bf10a02fc22c09f11e79"
  end

  depends_on xcode: ["16.4", :build]

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      ["--static-swift-stdlib"]
    end

    system "swift", "build", *args, "-c", "release", "--product", "PureSQLCLI"
    cp ".build/release/PureSQLCLI", ".build/release/puresql"
    bin.install ".build/release/puresql"
  end

  test do
    system bin/"puresql", "--help"
  end
end
