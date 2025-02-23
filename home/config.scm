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

(define job-updatedb
  #~(job "*/1 * * * *" "updatedb --localpaths=/home/enzuru --output=/home/enzuru/locatedb.n"))

(define job-tag-mail
  #~(job "*/1 * * * *" "~/bin/tag-mail"))

;; Packages and environment

(home-environment
 (packages (specifications->packages
            (list
             "ansible"
             "aspell"
             "aspell-dict-en"
             "autoconf"
             "automake"
             "ccls"
             "clojure"
             "clojure-tools"
             "curl"
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
             "go"
             "godot"
             "gopls"
             "guile"
             "htop"
             "kitty"
             "leiningen"
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
              (list job-updatedb job-tag-mail))))
   (service home-shepherd-service-type
            (home-shepherd-configuration
             (auto-start? #t)
             (services (list service-offlineimap)))))))
