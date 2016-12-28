---
title: Documentation
section: Documentation
path0: system
---


Module Overview
===============

Binary modules
--------------

Haskus system handles low-level data structures in memory such as C structs,
unions, enums, bit fields, etc. It doesn't depend on C header files (.h) and
doesn't use preprocessors (cpp2hs, hsc2hs, etc.).

Interface with the Linux kernel
-------------------------------

Haskus system provides foreign primops to call Linux system calls from Haskell
code without going through the libc. In addition to basic system calls, it
provides wrappers for some Linux subsystems/features accessible through
multiplexing syscalls (e.g., ioctl) or through specific file systems (e.g.,
procfs, sysfs).

Formats
-------

The framework provides support for some file formats (e.g., ELF, DWARF, CPIO) and some
file system formats (e.g., ISO9660). These can be used to interact with Linux
(e.g., to look up for functions in the vDSO ELF image), to build initramfs
images or bootable disk images, etc.

Architectures
-------------

The framework provides architecture specific modules (currently only for x86-64), in
particular the thin architecture specific layer to call Linux system calls.
Additionally, the framework has a dictionnary of x86 instructions; it is currently
used to implement a disassembler and could be used to implement assemblers,
analyzers, emulators, etc. A wrapper for the x86's cpuid instruction is also
provided.

System interface
----------------

The framework provides modules to interact with the system: input devices, display
devices, etc. These modules are used to easily build a custom system without
dealing directly with the low-level Linux interface. It also provides a custom
monad with common features for system programming (logging, etc.).


Additional documentation
========================

* API documentation can be built with "stack haddock" in the sources
* README_ in the sources
* The book_ (still being written)

.. _README: https://github.com/hsyl20/haskus-system/blob/master/README.md
.. _book: /books
