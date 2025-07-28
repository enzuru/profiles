# Guix profiles

My Guix profiles written in Scheme Lisp available as a learning tool.

The goal of my profiles are to create a Lisp-oriented workstation: the backend (operating system) is defined in Scheme Lisp and the frontend ("desktop" environment) and its tools are defined in Emacs Lisp. For portability, I write most of my personal tools in Common Lisp. Other development environments are supported too.

`clone.scm` clones my [.emacs.d](https://github.com/enzuru/.emacs.d) and some important dotfiles for booting into [StumpWM](https://stumpwm.github.io), [Quicklisp](https://www.quicklisp.org/beta/), [services for receiving and tagging email](https://notmuchmail.org), etc.

The goal is for Guix and Emacs to respectively provide the "backend" and "frontend" of my workstation.

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
- [Rust](https://www.rust-lang.org/)

### Scripting

- [Node.js](https://nodejs.org/en)
- [Python](https://www.python.org/)
- [Ruby](https://www.ruby-lang.org/en/)

### Functional

- [Elixir](https://elixir-lang.org/)
- [Haskell](https://www.haskell.org/)

### Lisp

- [Clojure](https://clojure.org/)
- [Common Lisp](https://www.sbcl.org/) (Steel Bank)
- [Emacs Lisp](https://en.wikipedia.org/wiki/Emacs_Lisp)
- [Scheme](https://www.gnu.org/software/guile/) (Guile)

## Usage

You'll want to modify these files to meet your own usecase; shouldn't take long.

Setting up my Guix system is as simple as:

```sh
guix install git ansible
git clone git@github.com:enzuru/profiles.git
cd profiles
ansible-playbook clone.yml
# reboot
guix pull
guix home reconfigure home/config.scm
sudo guix system reconfigure <device>.scm
# reboot
```

Note, `sudo` is needed because that guix command requires the user's path, so don't just run it as root.

## Tested platforms

Probably works on any modern version of Guix. Here's what I've actually tested recently:

- Guix 1.4
