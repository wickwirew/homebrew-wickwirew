class Otter < Formula
  desc "A SQLite compiler for Swift"
  homepage "https://github.com/wickwirew/Otter"
  license "MIT"
  head "https://github.com/wickwirew/Otter.git", branch: "main"

  depends_on xcode: ["16.3", :build]

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      ["--static-swift-stdlib"]
    end

    system "swift", "build", *args, "-c", "release", "--product", "otter"
    system "cp", ".build/release/OtterCLI", "./build/release/otter"
    bin.install ".build/release/otter"
  end

  test do
    otter --help
  end
end
