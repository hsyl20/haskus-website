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

   1. `Discussing the approach </system/manual/approach>`_

#. `Building and booting a System </system/manual/booting>`_

   1. `Building systems </system/manual/booting/building>`_
   #. `Creating ramdisks </system/manual/booting/ramdisk>`_
   #. `Building Linux </system/manual/booting/linux>`_
   #. `Testing with QEMU </system/manual/booting/QEMU>`_
   #. `Distributing your system </system/manual/booting/distributing>`_

#. `High-level interfaces </system/manual/using>`_
   1. `The Sys monad </system/manual/using/sys_monad>`_
   1. `Device management (basics) </system/manual/using/devices>`_

#. Appendices

   1. `Modules overview </system/manual/modules_overview>`_
   1. `x86 architecture notes </system/manual/x86>`_
   1. `Binary modules </system/manual/binary>`_
   1. Variant/Flow





Additional documentation
========================

* API documentation can be built with "stack haddock" in the sources
