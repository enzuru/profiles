# Guix profiles

My Guix profiles written in Scheme Lisp available as a learning tool.

Setting up my entire workstation is as simple as:

```
guix system reconfigure configuration.scm
guix package -m enzuru.scm
guile -l clone.scm
```

You can probably skip the first line given that it is personal to my hardware.
