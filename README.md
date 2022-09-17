# Guix profiles

My Guix profiles written in Scheme Lisp available as a learning tool.

The goal of my profiles are to create a Lisp-oriented workstation: the backend (operating system) is defined in Scheme Lisp and the frontend (desktop environment) and its tools are defined in Emacs Lisp. I write most of my personal programs in Common Lisp.

`enzuru.scm` installs important packages. `clone.scm` clones my [.emacs.d](https://github.com/enzuru/.emacs.d) and some important dotfiles for booting into [exwm](https://github.com/enzuru/.emacs.d), quicklisp, services for receiving and tagging email, etc. We also setup Emacs [with native compilation](https://www.emacswiki.org/emacs/GccEmacs).

You'll want to modify these files to meet your own usecase, but it could be valuable trying them as-is first.

Setting up my Guix user is as simple as:

```
git clone https://github.com/flatwhatson/guix-channel.git
guix install -L ./guix-channel emacs-native-comp
guix package -m enzuru.scm
guile -l clone.scm
```

# License

Licensed under the GPLv3; copyright is assigned to the nonprofit Salma Karama, LLC
