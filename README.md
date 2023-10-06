# Guix profiles

My Guix profiles written in Scheme Lisp available as a learning tool.

The goal of my profiles are to create a Lisp-oriented workstation: the backend (operating system) is defined in Scheme Lisp and the frontend ("desktop" environment) and its tools are defined in Emacs Lisp. For portability, I write most of my personal tools in Common Lisp. Other popular development environments are supported too.

`enzuru.scm` installs important packages. `clone.scm` clones my [.emacs.d](https://github.com/enzuru/.emacs.d) and some important dotfiles for booting into the [exwm window manager](https://github.com/enzuru/.emacs.d), [Quicklisp](https://www.quicklisp.org/beta/), [services for receiving and tagging email](https://notmuchmail.org), etc. I also setup Emacs [with native compilation](https://www.emacswiki.org/emacs/GccEmacs).

The goal is for Guix and Emacs to respectively provide the "backend" and "frontend" of my programming environment.

## Notable applications

| Feature        | Tool                                                           |
|----------------|----------------------------------------------------------------|
| Browser        | [Nyxt](https://nyxt.atlas.engineer/)                           |
| Editor         | [GNU Emacs](https://github.com/enzuru/.emacs.d)                |
| File manager   | [Midnight Commander](https://midnight-commander.org/)          |
| GPU stack      | [ROCm](https://www.amd.com/en/graphics/servers-solutions-rocm) |
| Shell          | [fish](https://fishshell.com/)                                 |
| Terminal       | [kitty](https://sw.kovidgoyal.net/kitty/)                      |
| Window manager | [StumpWM](https://stumpwm.github.io)                           |

## Development platforms

### Compiled

- [C](https://en.wikipedia.org/wiki/C_(programming_language))
- [C++](https://en.wikipedia.org/wiki/C%2B%2B)
- [Go](https://go.dev/)
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
- [Guile](https://www.gnu.org/software/guile/)

## Usage

You'll want to modify these files to meet your own usecase; shouldn't take long.

Setting up my Guix system is as simple as:

```
guile -l clone.scm
guix pull
sudo guix system reconfigure configuration.scm
guix package -m enzuru.scm
```

Note, `sudo` is needed because that guix command requires the user's path, so don't just run it as root.

## Tested platforms

Probably works on any modern version of Guix. Here's what I've actually tested recently:

- Guix 1.3
- Guix 1.4

## License

Licensed under the GPLv3; copyright is assigned to my eponymous nonprofit [enzu.ru](https://enzu.ru)
