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
            (list
             "amd-microcode"
             "amdgpu-firmware"
             "ansible"
             "aspell"
             "aspell-dict-en"
             "autoconf"
             "automake"
             "ccls"
             "clojure"
             "clojure-tools"
             "containerd"
             "curl"
             "dbus"
             "docker"
             "docker-cli"
             "elixir"
             "emacs"
             "exercism"
             "firefox"
             "font-bitstream-vera"
             "font-fira-code"
             "font-fira-sans"
             "font-iosevka"
             "font-microsoft-web-core-fonts"
             "font-terminus"
             "fontconfig"
             "gcc-toolchain"
             "gdb"
             "ghc"
             "gimp"
             "git"
             "glances"
             "gnustep-make"
             "go"
             "godot"
             "gopls"
             "gpm"
             "guile"
             "htop"
             "kitty"
             "leiningen"
             "libobjc2"
             "make"
             "man-pages"
             "mc"
             "mg"
             "node"
             "notmuch"
             "nushell"
             "nyxt"
             "offlineimap3"
             "openjdk"
             "openmw"
             "php"
             "pianobar"
             "python"
             "python-lsp-server"
             "ruby"
             "ruby-solargraph"
             "rust"
             "rust-analyzer"
             "sbcl"
             "setxkbmap"
             "tmux"
             "xf86-video-amdgpu"
             "xhost"
             "xlsfonts"
             "xrdb"
             "xset"
             "xsetroot"
             "xterm")))

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
