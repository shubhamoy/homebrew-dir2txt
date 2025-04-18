class Dir2txt < Formula
    desc "Generate directory tree + content dump, LLM-friendly"
    homepage "https://github.com/shubhamoy/dir2txt"
    url "https://github.com/shubhamoy/dir2txt/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "f10a236079966de86a07a424c2b444d06d20df0ba69c0da65adbcc2f68799ae1"
    license "MIT"
    version "1.0.0"
  
    depends_on "cmake" => :build
    depends_on "gcc" => :build unless OS.mac?
  
    def install
      mkdir "build" do
        system "cmake", "..", *std_cmake_args
        system "cmake", "--build", "."
        bin.install "dir2txt"
      end
    end
  
    test do
      assert_match "dir2txt", shell_output("#{bin}/dir2txt --help")
    end
  end