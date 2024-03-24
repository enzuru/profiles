(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (gnu home services shells)
             (gnu home services shepherd)
             (gnu home services mcron)
             (guix scripts environment)
             (gnu packages mail))

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
  #~(job "0 * * * *" "/home/enzuru/bin/clear-cache"))

(define job-updatedb
  #~(job "*/1 * * * *" "updatedb --localpaths=/home/enzuru --output=/home/enzuru/locatedb.n"))

(define job-tag-mail
  #~(job "*/1 * * * *" "/home/enzuru/bin/tag-mail"))

;; Packages and environment

(home-environment
 (packages (specifications->packages
            (list "mesa-opencl-rusticle"
                  "hipamd"
                  "mesa-opencl-icd"
                  "gopls"
                  "ruby-solargraph"
                  "gdb"
                  "zlib"
                  "p11-kit"
                  "xdg-desktop-portal"
                  "xdg-desktop-portal-gtk"
                  "sbcl"
                  "bind"
                  "flatpak"
                  "gnupg"
                  "ansible"
                  "unzip"
                  "wine"
                  "zip"
                  "godot"
                  "rust:cargo"
                  "man-pages"
                  "node"
                  "emacs-next"
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
                  "rocm-cmake@5.6.0"
                  "rocm-bandwidth-test"
                  "rocm-opencl-runtime"
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
                  "ncurses"
                  "mosh"
                  "wireshark"
                  "tcpdump"
                  "libpthread-stubs"
                  "pkg-config"
                  "vlc"
                  "screen"
                  "tmux"
                  "containerd"
                  "docker-cli"
                  "docker"
                  "python-lsp-server"
                  "glances"
                  "ccls"
                  "ruby@3.2.2"
                  "strace"
                  "elixir"
                  "rust"
                  "ghc"
                  "mc"
                  "php"
                  "go"
                  "curl"
                  "automake"
                  "autoconf"
                  "python"
                  "openjdk@18.0.2:jdk"
                  "exercism"
                  "openjdk@18.0.2"
                  "pianobar"
                  "nyxt"
                  "gimp"
                  "dbus"
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
                  "gcc-toolchain"
                  "libvterm"
                  "setxkbmap"
                  "gpm"
                  "make"
                  "neofetch"
                  "the-silver-searcher")))

 (services
  (list
   (service home-shepherd-service-type
            (home-shepherd-configuration
             (auto-start? #t)
             (services
              (list service-offlineimap))))
   (service home-mcron-service-type
            (home-mcron-configuration
             (jobs
              (list job-clear-cache job-updatedb job-tag-mail)))))))
