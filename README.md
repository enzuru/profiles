# Guix profiles

My Guix profiles written in Scheme Lisp available as a learning tool.

The goal of my profiles are to create a Lisp-oriented workstation: the backend (operating system) is defined in Scheme Lisp and the frontend ("desktop" environment) and its tools are defined in Emacs Lisp. For portability, I write most of my personal tools in Common Lisp. Other popular development environments are supported too.

`enzuru.scm` installs important packages. `clone.scm` clones my [.emacs.d](https://github.com/enzuru/.emacs.d) and some important dotfiles for booting into [StumpWM](https://stumpwm.github.io), [Quicklisp](https://www.quicklisp.org/beta/), [services for receiving and tagging email](https://notmuchmail.org), etc.

The goal is for Guix and Emacs to respectively provide the "backend" and "frontend" of my programming environment.

## Notable applications

| Feature              | Tool                                                           |
|----------------------|----------------------------------------------------------------|
| Browser              | [Nyxt](https://nyxt.atlas.engineer/)                           |
| Editor               | [Emacs](https://github.com/enzuru/.emacs.d)                    |
| File manager         | [Midnight Commander](https://midnight-commander.org/)          |
| GPU stack            | [ROCm](https://www.amd.com/en/graphics/servers-solutions-rocm) |
| Shell                | [fish](https://fishshell.com/)                                 |
| Terminal             | [kitty](https://sw.kovidgoyal.net/kitty/)                      |
| Terminal multiplexer | [tmux](https://github.com/tmux/tmux/wiki)                      |
| Window manager       | [StumpWM](https://stumpwm.github.io)                           |

## Development platforms

### Compiled

- [C](https://en.wikipedia.org/wiki/C_(programming_language))
- [C++](https://en.wikipedia.org/wiki/C%2B%2B)
- [Go](https://go.dev/)
- [Objective-C](https://gnustep.github.io/) (GNUstep)
- [Rust](https://www.rust-lang.org/)

### Scripting

- [Node.js](https://nodejs.org/en)
- [PHP](https://www.php.net/)
- [Python](https://www.python.org/)
- [Ruby](https://www.ruby-lang.org/en/)

### Functional

- [Elixir](https://elixir-lang.org/)
- [Haskell](https://www.haskell.org/)

### Lisp

- [Clojure](https://clojure.org/)
- [Common Lisp](https://www.sbcl.org/) (Steel Bank)
- [Emacs Lisp](https://en.wikipedia.org/wiki/Emacs_Lisp)
- [Guile](https://www.gnu.org/software/guile/)

## Usage

You'll want to modify these files to meet your own usecase; shouldn't take long.

Setting up my Guix system is as simple as:

```
ansible-playbook clone.yml
guix pull
guix package -m enzuru.scm
sudo guix system reconfigure configuration.scm
```

Note, `sudo` is needed because that guix command requires the user's path, so don't just run it as root.

## Tested platforms

Probably works on any modern version of Guix. Here's what I've actually tested recently:

- Guix 1.3
- Guix 1.4

## License

Licensed under the GPLv3; copyright is assigned to my eponymous charity [enzu.ru](https://enzu.ru)
