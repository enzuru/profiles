;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(specifications->manifest
  (list "openjdk"
        "leiningen"
        "docker"
        "clojure"
        "gtk"
        "gnupg"
        "pianobar"
        "nyxt"
        "guile-chickadee"
        "sdl2"
        "gimp"
        "icecat"
        "node"
        "ghc"
        "gcc-toolchain"
        "libgccjit"
        "libxml2"
        "gconf"
        "dbus"
        "gpm"
        "imagemagick"
        "cairo"
        "sqlite"
        "ncurses"
        "gnutls"
        "libtiff"
        "libungif"
        "libjpeg"
        "libxaw"
        "autoconf"
        "python"
        "ruby"
        "screenfetch"
        "emacs-native-comp"
        "offlineimap3"
        "git"
        "glibc"
        "libvterm"
        "make"
        "cmake"
        "neofetch"
        "ccls"
        "notmuch"
        "mg"
        "xset"
        "xhost"
        "setxkbmap"
        "xsetroot"
        "xterm"
        "xrdb"
        "xfontsel"
        "curl"
        "irssi"
        "fontconfig"
        "font-iosevka"
        "font-terminus"
        "links"
        "unzip"
        "sendmail"
        "ntp"
        "transset"
        "guile-git"
        "sbcl"
        "guile"
        "glances"
        "rxvt-unicode"
        "the-silver-searcher"
        "glibc-locales"))
