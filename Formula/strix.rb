class Strix < Formula
  desc "LTL Satisfiability Checker"
  homepage "https://github.com/meyerphi/strix"
  url "https://github.com/meyerphi/strix/releases/download/21.0.0/strix-21-0.0-1-src.tar.gz"
  sha256 "9b986f0fe71d32c6b8079f8c807f457099dd68a3eecb2653130540b442b54ce9"
  license "GPL-3.0-or-later"
  head "https://github.com/meyerphi/strix.git", branch: "main"

  depends_on "rust" => :build
  depends_on "openjdk@11" => :build

  def install
    # Ensure GraalVM with native-image is available
    graalvm_home = "/Library/Java/JavaVirtualMachines/graalvm-17.jdk/Contents/Home"
    odie <<~EOS unless File.directory?(graalvm_home)
      GraalVM JDK 17 not found at:
        #{graalvm_home}

      Please install it via Homebrew cask:

          brew install --cask graalvm-jdk@17

      Then re-run: brew install --build-from-source gmerlino/strix/strix
    EOS

#    inreplace "lib/owl/owl/build.gradle",
#          /implementation.*org\.graalvm\.sdk:graal-sdk.*$/,
#          'compileOnly "org.graalvm.sdk:graal-sdk"'
    inreplace "lib/owl/scripts/link_static_lib.sh",
          /^cc\s+\$.*$/,
          '/usr/bin/clang "$@"'

    ENV["CC"] = "/usr/bin/clang"
    ENV["CXX"] = "/usr/bin/clang++"
    ENV.prepend_path "PATH", "#{graalvm_home}/bin"
    ENV["JAVA_HOME"] = Formula["openjdk@11"].opt_prefix
    ENV["NATIVE_IMAGE_OPTS"] = "-H:+AllowDeprecatedBuilderClassesOnImageClasspath -H:-CheckToolchain"
    ENV["GRADLE_OPTS"] = [
  "--no-build-cache",
  "-Dorg.graalvm.nativeimage.options=-H:+AllowDeprecatedBuilderClassesOnImageClasspath -H:-CheckToolchain"
].join(" ")
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/strix --help")
  end
end

