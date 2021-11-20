;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(specifications->manifest
  (list "ccls"
        "guile-chickadee"
        "sdl2"
        "gimp"
        "imagemagick"
        "notmuch"
        "icecat"
        "emacs-native-comp"
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
        "offlineimap3"
        "fontconfig"
        "font-iosevka"
        "font-terminus"
        "git"
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
