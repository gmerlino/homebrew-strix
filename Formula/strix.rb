class Strix < Formula
  desc "Reactive synthesis of controllers from LTL specifications"
  homepage "https://github.com/meyerphi/strix"
  url "https://github.com/meyerphi/strix/releases/download/21.0.0/strix-21-0.0-1-src.tar.gz"
  sha256 "9b986f0fe71d32c6b8079f8c807f457099dd68a3eecb2653130540b442b54ce9"
  license "AGPL-3.0-only"
  revision 1

  depends_on "rust" => :build
  depends_on :macos

  # Private build tools: no system-wide JDK or GraalVM cask is required.
  resource "graalvm" do
    on_arm do
      url "https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-17.0.9/graalvm-community-jdk-17.0.9_macos-aarch64_bin.tar.gz"
      sha256 "3eccc4ffda01818172b7fc7cdf4379bc62ed7129ee30ca854c04da67057249c9"
    end
    on_intel do
      url "https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-17.0.9/graalvm-community-jdk-17.0.9_macos-x64_bin.tar.gz"
      sha256 "543dd286d99c04788847ef6366f794c059a69e77added577916186371e206e33"
    end
  end

  resource "gradle" do
    url "https://services.gradle.org/distributions/gradle-7.6.4-bin.zip"
    sha256 "bed1da33cca0f557ab13691c77f38bb67388119e4794d113e051039b80af9bb1"
  end

  resource "jar-ST4" do
    url "https://repo.maven.apache.org/maven2/org/antlr/ST4/4.3/ST4-4.3.jar"
    sha256 "28547dba48cfceb77b6efbfe069aebe9ed3324ae60dbd52093d13a1d636ed069"
  end

  resource "jar-antlr-runtime" do
    url "https://repo.maven.apache.org/maven2/org/antlr/antlr-runtime/3.5.2/antlr-runtime-3.5.2.jar"
    sha256 "ce3fc8ecb10f39e9a3cddcbb2ce350d272d9cd3d0b1e18e6fe73c3b9389c8734"
  end

  resource "jar-antlr4" do
    url "https://repo.maven.apache.org/maven2/org/antlr/antlr4/4.8-1/antlr4-4.8-1.jar"
    sha256 "3e4c8132600b3185b9e1c3326756eeaa97639b5e9b10e87d8c95648041f903eb"
  end

  resource "jar-antlr4-runtime" do
    url "https://repo.maven.apache.org/maven2/org/antlr/antlr4-runtime/4.8-1/antlr4-runtime-4.8-1.jar"
    sha256 "bdcf58107ba1a499b25e3db205086767dd409d3f5ab12c90f2d429f55ec774a6"
  end

  resource "jar-auto-value" do
    url "https://repo.maven.apache.org/maven2/com/google/auto/value/auto-value/1.7.4/auto-value-1.7.4.jar"
    sha256 "8320edb037b62d45bc05ae4e1e21941255ef489e950519ef14d636d66870da64"
  end

  resource "jar-auto-value-annotations" do
    url "https://repo.maven.apache.org/maven2/com/google/auto/value/auto-value-annotations/1.7.4/auto-value-annotations-1.7.4.jar"
    sha256 "fedd59b0b4986c342f6ab2d182f2a4ee9fceb2c7e2d5bdc4dc764c92394a23d3"
  end

  resource "jar-checker-qual" do
    url "https://repo.maven.apache.org/maven2/org/checkerframework/checker-qual/3.5.0/checker-qual-3.5.0.jar"
    sha256 "729990b3f18a95606fc2573836b6958bcdb44cb52bfbd1b7aa9c339cff35a5a4"
  end

  resource "jar-commons-cli" do
    url "https://repo.maven.apache.org/maven2/commons-cli/commons-cli/1.4/commons-cli-1.4.jar"
    sha256 "fd3c7c9545a9cdb2051d1f9155c4f76b1e4ac5a57304404a6eedb578ffba7328"
  end

  resource "jar-error_prone_annotations" do
    url "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.3.4/error_prone_annotations-2.3.4.jar"
    sha256 "baf7d6ea97ce606c53e11b6854ba5f2ce7ef5c24dddf0afa18d1260bd25b002c"
  end

  resource "jar-failureaccess" do
    url "https://repo.maven.apache.org/maven2/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar"
    sha256 "a171ee4c734dd2da837e4b16be9df4661afab72a41adaf31eb84dfdaf936ca26"
  end

  resource "jar-graal-sdk" do
    url "https://repo.maven.apache.org/maven2/org/graalvm/sdk/graal-sdk/23.0.2/graal-sdk-23.0.2.jar"
    sha256 "119501aa8db193e22baa450986dda91e80230398fd891b0ea31937d05e0a1f45"
  end

  resource "jar-guava" do
    url "https://repo.maven.apache.org/maven2/com/google/guava/guava/30.1-jre/guava-30.1-jre.jar"
    sha256 "e6dd072f9d3fe02a4600688380bd422bdac184caf6fe2418cfdd0934f09432aa"
  end

  resource "jar-icu4j" do
    url "https://repo.maven.apache.org/maven2/com/ibm/icu/icu4j/61.1/icu4j-61.1.jar"
    sha256 "55c98eb1838b2a4bb9a07dc36bd378532d64d0cdcb7ceee914236866a7de4464"
  end

  resource "jar-j2objc-annotations" do
    url "https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.3/j2objc-annotations-1.3.jar"
    sha256 "21af30c92267bd6122c0e0b4d20cccb6641a37eaf956c6540ec471d584e64a7b"
  end

  resource "jar-javax.json" do
    url "https://repo.maven.apache.org/maven2/org/glassfish/javax.json/1.0.4/javax.json-1.0.4.jar"
    sha256 "0e1dec40a1ede965941251eda968aeee052cc4f50378bc316cc48e8159bdbeb4"
  end

  resource "jar-jbdd" do
    url "https://repo.maven.apache.org/maven2/de/tum/in/jbdd/0.5.2/jbdd-0.5.2.jar"
    sha256 "d89af013ca4e228af27361c7444eb3d2c1484f697553d879f6ffb818db0167e7"
  end

  resource "jar-jsr305" do
    url "https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar"
    sha256 "766ad2a0783f2687962c8ad74ceecc38a28b9f72a2d085ee438b7813e928d0c7"
  end

  resource "jar-listenablefuture" do
    url "https://repo.maven.apache.org/maven2/com/google/guava/listenablefuture/9999.0-empty-to-avoid-conflict-with-guava/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar"
    sha256 "b372a037d4230aa57fbeffdef30fd6123f9c0c2db85d0aced00c91b974f33f99"
  end

  resource "jar-org.abego.treelayout.core" do
    url "https://repo.maven.apache.org/maven2/org/abego/treelayout/org.abego.treelayout.core/1.0.3/org.abego.treelayout.core-1.0.3.jar"
    sha256 "fa5e31395c39c2e7d46aca0f81f72060931607b2fa41bd36038eb2cb6fb93326"
  end

  resource "jar-value" do
    url "https://repo.maven.apache.org/maven2/org/immutables/value/2.7.1/value-2.7.1-annotations.jar"
    sha256 "c878caa64433f12a6ae6848e2122ca06cfd77214acfa06b287d913b9c119aa99"
  end

  # Source compatibility changes for GraalVM 23 and modern Clang.
  patch :DATA

  def install
    resource("graalvm").stage buildpath/"build-tools/graalvm"
    resource("gradle").stage buildpath/"build-tools/gradle"
    resources.select { |r| r.name.start_with?("jar-") }.each do |r|
      r.stage { (buildpath/"lib/owl/owl/homebrew-jars"/r.name.delete_prefix("jar-")).install Dir["*.jar"] }
    end
    java_home = buildpath/"build-tools/graalvm/Contents/Home"
    ENV["JAVA_HOME"] = java_home
    ENV["GRAAL_HOME"] = java_home
    ENV["GRADLE_USER_HOME"] = buildpath/".gradle"
    ENV.prepend_path "PATH", java_home/"bin"
    ENV.prepend_path "PATH", buildpath/"build-tools/gradle/bin"
    ENV["LIBCLANG_PATH"] = Pathname.new(Utils.safe_popen_read("xcrun", "--find", "clang").strip).dirname.parent/"lib"
    ENV.clang
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/strix --version")
    controller = shell_output("#{bin}/strix -f 'G (grant <-> req)' --ins=req --outs=grant")
    assert_match "REALIZABLE\n", controller
    assert_match "HOA: v1", controller
    assert_match "--END--", controller
    assert_equal "UNREALIZABLE\n",
                 shell_output("#{bin}/strix --realizability -f 'G grant & G !grant' --outs=grant")
  end
end

__END__
--- a/lib/owl/build.rs
+++ b/lib/owl/build.rs
@@ -15,12 +15,6 @@
     let owl_dir = build_env.root_dir.join("owl");
     let out_dir = build_env.out_dir;
 
-    let gradlew_script = if cfg!(target_os = "windows") {
-        "gradlew.bat"
-    } else {
-        "gradlew"
-    };
-    let gradlew = owl_dir.join(gradlew_script);
     let cache_dir = out_dir.join(".gradle");
     let link_script = if cfg!(target_os = "windows") {
         "link_static_lib.cmd"
@@ -29,7 +23,7 @@
     };
     let link_script_path = build_env.root_dir.join("scripts").join(link_script);
 
-    let mut gradlew_cmd = process::Command::new(gradlew);
+    let mut gradlew_cmd = process::Command::new("gradle");
     gradlew_cmd.env(
         "GRADLE_OPTS",
         &format!("-Dorg.gradle.project.buildDir={}", out_dir.display()),
@@ -38,7 +32,10 @@
     gradlew_cmd.env("CC", &format!("{}", link_script_path.display()));
     // options to build Owl in target directory
     gradlew_cmd.args(&[
-        "distZip",
+        "buildNativeLibrary",
+        "--no-daemon",
+        "--no-watch-fs",
+        "--offline",
         "-Pdisable-pandoc",
         &format!("-p{}", owl_dir.display()),
         &format!("--project-cache-dir={}", cache_dir.display()),
@@ -69,6 +66,13 @@
         pattern,
         &replacements,
     )?;
+
+    // Give the anonymous GraalVM enum a stable name for bindgen 0.58 with modern Clang.
+    let header = std::fs::read_to_string(&graal_header)?;
+    std::fs::write(&graal_header, header.replace(
+        "enum { __graal_create_isolate_params_version",
+        "enum graal_create_isolate_params_version { __graal_create_isolate_params_version",
+    ))?;
 
     // generate bindings to Owl headers
     bindgen::Builder::default()
--- a/lib/owl/owl/build.gradle
+++ b/lib/owl/owl/build.gradle
@@ -77,47 +77,36 @@
 apply from: 'gradle/analysis.gradle'
 apply from: 'gradle/antlr.gradle'
 
-repositories {
-    mavenCentral()
-}
-
+// Homebrew downloads and verifies these pinned JARs before the offline build.
 dependencies {
-    // https://github.com/google/guava
-    implementation 'com.google.guava:guava:30.1-jre'
-
-    // https://commons.apache.org/proper/commons-cli/
-    implementation 'commons-cli:commons-cli:1.4'
-
-    // https://github.com/incaseoftrouble/jbdd
-    implementation 'de.tum.in:jbdd:0.5.2'
-
-    // http://www.antlr.org/
-    // https://mvnrepository.com/artifact/org.antlr/antlr4-runtime
-    implementation 'org.antlr:antlr4-runtime:4.8-1'
-
-    // https://automata.tools/hoa/jhoafparser/
     implementation files('lib/jhoafparser-1.1.1.jar')
-
-    // https://www.graalvm.org/
-    // https://mvnrepository.com/artifact/org.graalvm.sdk/graal-sdk
-    implementation 'org.graalvm.sdk:graal-sdk:21.0.0.2'
-
-    // https://github.com/google/gson
-    testImplementation 'com.google.code.gson:gson:2.8.5'
-    // https://github.com/junit-team/junit5/
-    testImplementation 'org.junit.jupiter:junit-jupiter-api:5.6.2'
-    testImplementation 'org.junit.jupiter:junit-jupiter-params:5.6.2'
-    testRuntimeOnly 'org.junit.jupiter:junit-jupiter-engine:5.6.2'
-
-    antlr 'org.antlr:antlr4:4.8-1' // Introduces unused runtime dependencies; fixed in antlr.gradle
-
-    // https://mvnrepository.com/artifact/com.google.errorprone/error_prone_core
-    // TODO: Reenable
-    // errorprone 'com.google.errorprone:error_prone_core:2.3.4'
-
-    // https://mvnrepository.com/artifact/com.google.auto.value/auto-value
-    implementation 'com.google.auto.value:auto-value-annotations:1.7.4'
-    annotationProcessor 'com.google.auto.value:auto-value:1.7.4'
+    implementation fileTree(dir: 'homebrew-jars/antlr4', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/guava', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/commons-cli', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/jbdd', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/antlr4-runtime', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/auto-value-annotations', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/ST4', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/antlr-runtime', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/org.abego.treelayout.core', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/javax.json', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/icu4j', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/failureaccess', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/listenablefuture', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/jsr305', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/checker-qual', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/error_prone_annotations', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/j2objc-annotations', include: '*.jar')
+    implementation fileTree(dir: 'homebrew-jars/value', include: '*.jar')
+    compileOnly fileTree(dir: 'homebrew-jars/graal-sdk', include: '*.jar')
+    antlr fileTree(dir: 'homebrew-jars/antlr4', include: '*.jar')
+    antlr fileTree(dir: 'homebrew-jars/antlr4-runtime', include: '*.jar')
+    antlr fileTree(dir: 'homebrew-jars/ST4', include: '*.jar')
+    antlr fileTree(dir: 'homebrew-jars/antlr-runtime', include: '*.jar')
+    antlr fileTree(dir: 'homebrew-jars/org.abego.treelayout.core', include: '*.jar')
+    antlr fileTree(dir: 'homebrew-jars/javax.json', include: '*.jar')
+    antlr fileTree(dir: 'homebrew-jars/icu4j', include: '*.jar')
+    annotationProcessor fileTree(dir: 'homebrew-jars/auto-value', include: '*.jar')
 }
 
 test {
@@ -237,10 +226,10 @@
         enableNativeAssertions ? '-ea' : '-da',
         "-DowlHeader=${projectDir}/src/main/c/headers",
         '--shared',
+        '-J-Xmx4g',
         // (can cause deadlock during image-build)
         '--initialize-at-build-time=com.google,org.apache,org.antlr,de.tum,owl,jhoafparser',
         '--no-fallback',
-        '--no-server',
         // (uncomment for performance analysis)
         // '-H:+PrintAnalysisCallTree',
         // '-H:DashboardDump=reports/graalvm-dashboard.dump',
@@ -273,7 +262,6 @@
         // (can cause deadlock during image-build)
         '--initialize-at-build-time=com.google,org.apache,org.antlr,de.tum,owl,jhoafparser',
         '--no-fallback',
-        '--no-server',
         // (uncomment for performance analysis)
         // '-H:+PrintAnalysisCallTree',
         // '-H:DashboardDump=reports/graalvm-dashboard.dump',
--- a/lib/owl/scripts/link_static_lib.sh
+++ b/lib/owl/scripts/link_static_lib.sh
@@ -9,7 +9,7 @@
 
 SCRIPT=""
 LIBTOOL=()
-for key in $*; do
+for key in "$@"; do
     if [[ $key == -* ]]; then
         # linker option
         continue
@@ -45,7 +45,7 @@
 
 if [ "$make_static_libtool" == true ]; then
     # Create static library with OSX libtool
-    libtool -static "${LIBTOOL[@]}"
+    /usr/bin/libtool -static "${LIBTOOL[@]}"
     result=$?
     if [ $result -ne 0 ]; then
         exit $result
@@ -55,4 +55,4 @@
 # Call C compiler for compilation or linking step.
 # This will also create the shared library in addition
 # to the static library.
-cc $*
+/usr/bin/clang "$@"
--- a/lib/owl/owl/src/main/java/owl/cinterface/CInterface.java
+++ b/lib/owl/owl/src/main/java/owl/cinterface/CInterface.java
@@ -30,7 +30,6 @@
 import org.graalvm.nativeimage.c.type.CTypeConversion;
 import org.graalvm.word.PointerBase;
 import org.graalvm.word.UnsignedWord;
-import org.graalvm.word.WordFactory;
 import owl.util.OwlVersion;
 
 @CContext(CInterface.CDirectives.class)
@@ -50,24 +49,21 @@
   private CInterface() {}
 
   @CEntryPoint(
-    name = "destroy_object_handle",
-    exceptionHandler = PrintStackTraceAndExit.ReturnVoid.class
+    name = "destroy_object_handle"
   )
   public static void destroyObjectHandle(IsolateThread thread, ObjectHandle handle) {
     ObjectHandles.getGlobal().destroy(handle);
   }
 
   @CEntryPoint(
-    name = "free_unmanaged_memory",
-    exceptionHandler = PrintStackTraceAndExit.ReturnVoid.class
+    name = "free_unmanaged_memory"
   )
   public static void freeUnmanagedMemory(IsolateThread thread, PointerBase ptr) {
     UnmanagedMemory.free(ptr);
   }
 
   @CEntryPoint(
-    name = "print_object_handle",
-    exceptionHandler = PrintStackTraceAndExit.ReturnUnsignedWord.class
+    name = "print_object_handle"
   )
   public static UnsignedWord printObjectHandle(
     IsolateThread thread, ObjectHandle handle, CCharPointer buffer, UnsignedWord bufferSize) {
@@ -77,8 +73,7 @@
   }
 
   @CEntryPoint(
-    name = "owl_version",
-    exceptionHandler = PrintStackTraceAndExit.ReturnUnsignedWord.class
+    name = "owl_version"
   )
   public static UnsignedWord owlVersion(
     IsolateThread thread, CCharPointer buffer, UnsignedWord bufferSize) {
@@ -103,69 +98,7 @@
     }
   }
 
-  static final class PrintStackTraceAndExit {
-
-    private PrintStackTraceAndExit() {}
-
-    static void handleException(Throwable throwable) {
-      throwable.printStackTrace(System.err);
-      System.err.flush();
-      System.exit(-1);
-    }
-
-    static final class ReturnObjectHandle {
-      private ReturnObjectHandle() {}
-
-      static ObjectHandle handleException(Throwable throwable) {
-        PrintStackTraceAndExit.handleException(throwable);
-        return ObjectHandles.getGlobal().create(null);
-      }
-    }
-
-    static final class ReturnUnsignedWord {
-      private ReturnUnsignedWord() {}
-
-      static UnsignedWord handleException(Throwable throwable) {
-        PrintStackTraceAndExit.handleException(throwable);
-        return WordFactory.unsigned(Long.MIN_VALUE);
-      }
-    }
-
-    static final class ReturnBoolean {
-      private ReturnBoolean() {}
-
-      static boolean handleException(Throwable throwable) {
-        PrintStackTraceAndExit.handleException(throwable);
-        return false;
-      }
-    }
-
-    static final class ReturnInt {
-      private ReturnInt() {}
-
-      static int handleException(Throwable throwable) {
-        PrintStackTraceAndExit.handleException(throwable);
-        return Integer.MIN_VALUE;
-      }
-    }
-
-    static final class ReturnAcceptance {
-      private ReturnAcceptance() {}
-
-      static CAutomaton.Acceptance handleException(Throwable throwable) {
-        PrintStackTraceAndExit.handleException(throwable);
-        return CAutomaton.Acceptance.BUCHI;
-      }
-    }
-
-    static final class ReturnVoid {
-      private ReturnVoid() {}
-
-      static void handleException(Throwable throwable) {
-        PrintStackTraceAndExit.handleException(throwable);
-      }
-    }
-  }
+  // GraalVM's default fatal handler reports uncaught exceptions and terminates.
 
   @CConstant("OWL_INITIAL_STATE")
   public static native int owlInitialState();
--- a/lib/owl/owl/src/main/java/owl/cinterface/CAutomaton.java
+++ b/lib/owl/owl/src/main/java/owl/cinterface/CAutomaton.java
@@ -93,8 +93,7 @@
       "Read a (deterministic) automaton from a char* serialised in the HOA format.",
       CInterface.CHAR_TO_STRING,
       CInterface.CALL_DESTROY
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnObjectHandle.class
+    }
   )
   public static ObjectHandle parse(
     IsolateThread thread,
@@ -168,8 +167,7 @@
     documentation = {
       "Translate the given formula to deterministic parity automaton.",
       CInterface.CALL_DESTROY
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnObjectHandle.class
+    }
   )
   public static ObjectHandle of(
     IsolateThread thread,
@@ -186,8 +184,7 @@
     documentation = {
     "Translate the given formula to deterministic parity automaton.",
       CInterface.CALL_DESTROY
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnObjectHandle.class
+    }
   )
   public static ObjectHandle of(
     IsolateThread thread,
@@ -203,8 +200,7 @@
     documentation = {
       "Translate the given formula to deterministic parity automaton.",
       CInterface.CALL_DESTROY
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnObjectHandle.class
+    }
   )
   public static ObjectHandle of(
     IsolateThread thread,
@@ -221,8 +217,7 @@
     documentation = {
       "Translate the given formula to deterministic parity automaton.",
       CInterface.CALL_DESTROY
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnObjectHandle.class
+    }
   )
   public static ObjectHandle of(
     IsolateThread thread,
@@ -240,8 +235,7 @@
     documentation = {
       "Translate the given formula to deterministic parity automaton.",
       CInterface.CALL_DESTROY
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnObjectHandle.class
+    }
   )
   public static ObjectHandle of(
     IsolateThread thread,
@@ -260,8 +254,7 @@
     documentation = {
       "Translate the given formula to deterministic parity automaton.",
       CInterface.CALL_DESTROY
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnObjectHandle.class
+    }
   )
   public static ObjectHandle of(
     IsolateThread thread,
@@ -281,8 +274,7 @@
     documentation = {
       "Translate the given formula to deterministic parity automaton.",
       CInterface.CALL_DESTROY
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnObjectHandle.class
+    }
   )
   public static ObjectHandle of(
     IsolateThread thread,
@@ -313,8 +305,7 @@
   }
 
   @CEntryPoint(
-    name = NAMESPACE + "acceptance_condition",
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnAcceptance.class
+    name = NAMESPACE + "acceptance_condition"
   )
   public static Acceptance acceptanceCondition(
     IsolateThread thread,
@@ -324,8 +315,7 @@
   }
 
   @CEntryPoint(
-    name = NAMESPACE + "acceptance_condition_sets",
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnInt.class
+    name = NAMESPACE + "acceptance_condition_sets"
   )
   public static int acceptanceConditionSets(
     IsolateThread thread,
@@ -335,8 +325,7 @@
   }
 
   @CEntryPoint(
-    name = NAMESPACE + "atomic_propositions",
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnInt.class
+    name = NAMESPACE + "atomic_propositions"
   )
   public static int atomicPropositions(
     IsolateThread thread,
@@ -349,8 +338,7 @@
     name = NAMESPACE + "atomic_propositions_uncontrollable_size",
     documentation = "Atomic propositions of the range [0, s[ are uncontrollable and [s, l[ are "
       + "controllable, where s is the value returned by this method. -1 is the default return "
-      + "value, when this value cannot be determined.",
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnInt.class
+      + "value, when this value cannot be determined."
   )
   public static int atomicPropositionsUncontrollableSize(
     IsolateThread thread,
@@ -360,8 +348,7 @@
   }
 
   @CEntryPoint(
-    name = NAMESPACE + "atomic_propositions_label",
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnUnsignedWord.class
+    name = NAMESPACE + "atomic_propositions_label"
   )
   public static UnsignedWord atomicPropositions(
     IsolateThread thread,
@@ -381,8 +368,7 @@
       "optional score buffer. If the scores are not required, the pointer may be set to NULL.",
       "The pointer returned via the vector_{int,double}_t structures must be freed using",
       "the method `free_unmanaged_memory`."
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnVoid.class
+    }
   )
   public static void edgeTree(
     IsolateThread thread,
@@ -642,8 +628,7 @@
       "- PERMUTATION: an int sequence of variable length with no duplicates.",
       "- ROUND_ROBIN_COUNTER: a single int.",
       "- TEMPORAL_OPERATORS_PROFILE: an int sequence of variable length with no duplicates."
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnBoolean.class
+    }
   )
   public static boolean extractFeatures(
     IsolateThread thread,
--- a/lib/owl/owl/src/main/java/owl/cinterface/CLabelledFormula.java
+++ b/lib/owl/owl/src/main/java/owl/cinterface/CLabelledFormula.java
@@ -70,8 +70,7 @@
       "Parse the given string with the given atomic propositions and return an LTL formula.",
       CInterface.CHAR_TO_STRING,
       CInterface.CALL_DESTROY
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnObjectHandle.class
+    }
   )
   public static ObjectHandle parse(
     IsolateThread thread,
@@ -92,8 +91,7 @@
         + "with finite semantics.",
       CInterface.CHAR_TO_STRING,
       CInterface.CALL_DESTROY
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnObjectHandle.class
+    }
   )
   public static ObjectHandle create(
     IsolateThread thread,
@@ -138,8 +136,7 @@
       "status of atomic proposition is written to the passed int pointer using the encoding ",
       "provided by `atomic_proposition_status_t`",
       CInterface.CALL_DESTROY
-    },
-    exceptionHandler = CInterface.PrintStackTraceAndExit.ReturnObjectHandle.class
+    }
   )
   public static ObjectHandle simplify(
     IsolateThread thread,
