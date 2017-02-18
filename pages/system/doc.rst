---
title: Documentation
section: Documentation
path0: system
---

Haskus System is a framework written in Haskell that can be used for system
programming. Fundamentally it is an experiment into providing an integrated
interface leveraging Haskell features (type-safety, STM, etc.) for the whole
system: input, display, sound, network, etc.

It is based directly and only on the Linux kernel:

* it doesn't contain any kernel level code (device driver, etc.)

* it doesn't rely on usual interfaces (e.g., libdrm, libinput, X11, wayland,
  etc.) to communicate with the kernel

Note that it still depends on GHC's RTS dependencies (libc, etc.).

Contents
--------

1. `Introduction <manual/intro>`_
1. `Modules overview <manual/modules_overview>`_


Additional documentation
========================

* API documentation can be built with "stack haddock" in the sources
* README_ in the sources
* The book_ (still being written)

.. _README: https://github.com/haskus/haskus-system/blob/master/README.md
.. _book: /books
