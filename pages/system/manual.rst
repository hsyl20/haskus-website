---
title: Documentation
section: Documentation
path0: system
---

``haskus-system`` is a framework written in Haskell that can be used for system
programming. Fundamentally it is an experiment into providing an integrated
interface leveraging Haskell features (type-safety, STM, etc.) for the whole
system: input, display, sound, network, etc.

Contents
--------

1. `Introduction </system/manual/intro>`_

   1. `Modules overview </system/manual/modules_overview>`_

#. `Building and Booting a System </system/manual/booting>`_

   1. `Building systems </system/manual/booting/building>`_
   1. `Creating ramdisks </system/manual/booting/ramdisk>`_
   1. `Building Linux </system/manual/booting/linux>`_
   1. `Testing with QEMU </system/manual/booting/QEMU>`_
   1. `Distributing your system </system/manual/booting/distributing>`_



Additional documentation
========================

* API documentation can be built with "stack haddock" in the sources
* README_ in the sources
* The book_ (still being written)

.. _README: https://github.com/haskus/haskus-system/blob/master/README.md
.. _book: /books
