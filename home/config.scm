(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (gnu home services shells)
             (gnu home services shepherd)
             (gnu home services mcron)
             (guix scripts environment)
             (gnu packages mail)
             (gnu packages guile-xyz))

;; Services

(define service-offlineimap
  (shepherd-service
   (provision '(offlineimap))
   (documentation "Run offlineimap")
   (start #~(make-forkexec-constructor
             (list #$(file-append offlineimap "/bin/offlineimap"))))
   (stop #~(make-kill-destructor))))

;; Jobs

(define job-clear-cache
  #~(job "0 * * * *" "~/bin/clear-cache &> clear-cache.log"))

(define job-updatedb
  #~(job "*/1 * * * *" "updatedb --localpaths=/home/enzuru --output=/home/enzuru/locatedb.n"))

(define job-tag-mail
  #~(job "*/5 * * * *" "~/bin/tag-mail &> tag-mail.log"))

;; Packages and environment

(home-environment
 (packages (specifications->packages
            (list "nushell"
                  "pkg-config"
                  "xz"
                  "ncurses"
                  "make"
                  "gmp"
                  "gcc-toolchain"
                  "curl"
                  "perl"
                  "ghc-call-stack"
                  "emacs"
                  "libelf"
                  "bc"
                  "bison"
                  "flex"
                  "man-pages"
                  "btop"
                  "hipamd"
                  "rocr-runtime@5.7"
                  "rocminfo@5.7"
                  "rocm-opencl-runtime"
                  "rocm-device-libs@5.7"
                  "rocm-bandwidth-test@5"
                  "rocm-comgr@5.7"
                  "rocm-cmake@5.7"
                  "python-lsp-server"
                  "llama-cpp"
                  "ansible"
                  "glances"
                  "gnupg@2.2"
                  "mesa-opencl-icd"
                  "dbus"
                  "llvm@15"
                  "gopls"
                  "ruby-solargraph"
                  "gdb@12"
                  "zlib"
                  "sbcl"
                  "bind"
                  "unzip"
                  "wine"
                  "zip"
                  "godot@4.1"
                  "rust:cargo"
                  "node"
                  "tree-sitter-python"
                  "tree-sitter-markdown"
                  "tree-sitter-scheme"
                  "tree-sitter-typescript"
                  "tree-sitter-javascript"
                  "tree-sitter-rust"
                  "tree-sitter-ruby"
                  "tree-sitter-html"
                  "tree-sitter-php"
                  "tree-sitter-org"
                  "tree-sitter-json"
                  "tree-sitter-java"
                  "tree-sitter-haskell"
                  "tree-sitter-css"
                  "tree-sitter-go"
                  "tree-sitter-dockerfile"
                  "tree-sitter-elixir"
                  "tree-sitter-clojure"
                  "tree-sitter-cpp"
                  "tree-sitter-c"
                  "tree-sitter"
                  "windowmaker"
                  "gnustep-make"
                  "libobjc2"
                  "imagemagick"
                  "guile-colorized"
                  "guile-readline"
                  "guile"
                  "font-fira-sans"
                  "font-bitstream-vera"
                  "font-microsoft-web-core-fonts"
                  "xlsfonts"
                  "font-terminus"
                  "rust-analyzer"
                  "rust-bindgen@0.64"
                  "ocl-icd"
                  "clinfo"
                  "clpeak"
                  "innoextract"
                  "openmw"
                  "amdgpu-firmware"
                  "amd-microcode"
                  "xf86-video-amdgpu"
                  "radeontop"
                  "mesa-utils"
                  "clojure-tools"
                  "clojure"
                  "kitty"
                  "font-fira-code"
                  "fontconfig"
                  "firefox"
                  "mosh"
                  "wireshark"
                  "tcpdump"
                  "libpthread-stubs"
                  "vlc"
                  "screen"
                  "tmux"
                  "containerd"
                  "docker-cli"
                  "docker"
                  "ccls"
                  "ruby@3.2.2"
                  "strace"
                  "elixir"
                  "rust"
                  "ghc@9.2.5"
                  "mc"
                  "php"
                  "go@1.21"
                  "automake"
                  "autoconf"
                  "python"
                  "openjdk@18.0.2:jdk"
                  "exercism"
                  "openjdk@18.0.2"
                  "pianobar"
                  "nyxt"
                  "gimp"
                  "screenfetch"
                  "offlineimap3"
                  "git"
                  "notmuch"
                  "mg"
                  "xset"
                  "xhost"
                  "xsetroot"
                  "xterm"
                  "xrdb"
                  "xfontsel"
                  "irssi"
                  "font-iosevka"
                  "links"
                  "ntp"
                  "aspell-dict-en"
                  "hunspell-dict-en-us"
                  "hunspell"
                  "ispell"
                  "aspell"
                  "htop"
                  "leiningen"
                  "libvterm"
                  "setxkbmap"
                  "gpm"
                  "neofetch"
                  "the-silver-searcher")))

 (services
  (list
   (service home-mcron-service-type
            (home-mcron-configuration
             (jobs
              (list job-clear-cache job-updatedb job-tag-mail))))
   (service home-shepherd-service-type
            (home-shepherd-configuration
             (auto-start? #t)
             (services (list service-offlineimap)))))))
