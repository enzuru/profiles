;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(specifications->manifest
  (list "unzip"
        "sdl2"
        "gimp"
        "imagemagick"
        "sendmail"
        "ntp"
        "notmuch"
        "transset"
        "guile-git"
        "icecat"
        "sbcl"
        "guile"
        "glances"
        "rxvt-unicode"
        "the-silver-searcher"
        "emacs-native-comp"
        "mg"
        "xset"
        "xhost"
        "setxkbmap"
        "xsetroot"
        "xterm"
        "glibc-locales"
        "xrdb"
        "xfontsel"
        "curl@7.76"
        "irssi"
        "offlineimap"
        "fontconfig"
        "font-iosevka"
        "font-terminus"
        "git"))
