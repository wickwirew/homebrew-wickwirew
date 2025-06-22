class Otter < Formula
  desc "A SQLite compiler for Swift"
  homepage "https://github.com/wickwirew/Otter"
  license "MIT"
  head "https://github.com/wickwirew/Otter.git"

  depends_on xcode: ["15.3", :build]

  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--product", "otter"
    bin.install ".build/release/otter"
  end

  test do
    otter --help
  end
end
