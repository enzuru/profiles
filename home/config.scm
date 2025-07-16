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
             "binutils"
             "ccls"
             "clang"
             "clojure"
             "clojure-tools"
             "cmake"
             "curl"
             "docker"
             "docker-cli"
             "elixir"
             "emacs@30"
             "emacs-guix"
             "exercism"
             "firefox"
             "font-bitstream-vera"
             "font-fira-code"
             "font-fira-sans"
             "font-iosevka"
             "font-microsoft-web-core-fonts"
             "font-terminus"
             "font-fira-code"
             "fontconfig"
             "gcc-toolchain@15"
             "gdb"
             "ghc"
             "gimp"
             "git"
             "glances"
             "glibc"
             "gnugo"
             "go"
             "godot"
             "gopls"
             "guix"
             "guile"
             "htop"
             "kitty"
             "leiningen"
             "make"
             "man-db"
             "man-pages"
             "mc"
             "mg"
             "node"
             "notmuch"
             "nushell"
             "nyxt"
             "offlineimap3"
             "openjdk"
             "pianobar"
             "python"
             "python-lsp-server"
             "ruby"
             "ruby-solargraph"
             "rust"
             "rust-analyzer"
             "sbcl"
             "setxkbmap"
             "texinfo"
             "tmux"
             "tree-sitter"
             "tree-sitter-c"
             "xhost"
             "xlsfonts"
             "xrdb"
             "xset"
             "xsetroot"
             "xterm")))

 (services
  (append
   (list
    (service home-bash-service-type
             (home-bash-configuration
              (guix-defaults? #t)
              (bash-profile (list (plain-file "bash-profile" "\
export HISTFILE=$XDG_CACHE_HOME/.bash_history")))))
    (service home-mcron-service-type
             (home-mcron-configuration
              (jobs
               (list job-updatedb job-tag-mail))))
    (service home-shepherd-service-type
             (home-shepherd-configuration
              (auto-start? #t)
              (services (list service-offlineimap)))))
  %base-home-services)))
