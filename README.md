# Guix profiles

My Guix profiles written in Scheme Lisp available as a learning tool.

The goal of my profiles are to create a Lisp-oriented workstation: the backend (operating system) is defined in Scheme Lisp and the frontend ("desktop" environment) and its tools are defined in Emacs Lisp. For portability, I write most of my personal tools in Common Lisp. Other popular languages are supported too.

`enzuru.scm` installs important packages. `clone.scm` clones my [.emacs.d](https://github.com/enzuru/.emacs.d) and some important dotfiles for booting into [exwm](https://github.com/enzuru/.emacs.d), quicklisp, services for receiving and tagging email, etc. I also setup Emacs [with native compilation](https://www.emacswiki.org/emacs/GccEmacs).

You'll want to modify these files to meet your own usecase; shouldn't take long.

Setting up my Guix system is as simple as:

```
git clone https://github.com/flatwhatson/guix-channel.git
guix install -L ./guix-channel emacs-native-comp
guix package -m enzuru.scm
guile -l clone.scm
sudo guix system reconfigure configuration.scm
```

Note, `sudo` is needed because that guix command requires the user's path, so don't just run it as root.

# Tested platforms

Probably works on any modern version of Guix. Here's what I've actually tested recently:

- Guix 1.3
- Guix 1.4

# License

Licensed under the GPLv3; copyright is assigned to my eponymous nonprofit [enzu.ru](https://enzu.ru)
