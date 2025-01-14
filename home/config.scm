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
            (list "man-pages"
                  "hipamd"
                  "rocr-runtime"
                  "rocminfo"
                  "rocm-opencl-runtime"
                  "rocm-device-libs"
                  "rocm-bandwidth-test"
                  "rocm-comgr"
                  "rocm-cmake"
                  "python-lsp-server"
                  "llama-cpp"
                  "ansible"
                  "glances"
                  "gnupg"
                  "mesa-opencl-icd"
                  "dbus"
                  "llvm@15"
                  "gopls"
                  "ruby-solargraph"
                  "gdb"
                  "zlib"
                  "sbcl"
                  "bind"
                  "unzip"
                  "wine"
                  "zip"
                  "godot@4.1"
                  "rust:cargo"
                  "node"
                  "emacs-next"
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
                  "gcc-toolchain@13.2"
                  "libvterm"
                  "setxkbmap"
                  "gpm"
                  "make"
                  "neofetch"
                  "the-silver-searcher"
                  "gnupg")))

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
