class Otter < Formula
  desc "A SQLite compiler for Swift"
  homepage "https://github.com/wickwirew/PureSQL"
  license "MIT"
  head "https://github.com/wickwirew/PureSQL.git", branch: "main"

  depends_on xcode: ["16.3", :build]

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      ["--static-swift-stdlib"]
    end

    system "swift", "build", *args, "-c", "release", "--product", "PureSQLCLI"
    system "cp", ".build/release/PureSQLCLI", ".build/release/puresql"
    bin.install ".build/release/puresql"
  end

  test do
    otter --help
  end
end
