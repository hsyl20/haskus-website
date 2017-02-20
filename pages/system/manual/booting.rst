---
title: Documentation
section: Documentation
path0: system
---

.. contents::

Building and Booting a System
=============================

When a computer boots, the control is given to the following components in
sequence:

1. Hardware
2. BIOS (Basic input/output system)
3. Boot loader (e.g., Syslinux)
4. Kernel (e.g., Linux)
5. System (e.g., /init)

In our case, systems (step 5 of the boot sequence) are user-space programs
written in Haskell and using the ``haskus-system``. You first need to learn how
to `build them <booting/building>`_.

To `test your systems <booting/QEMU>`_ with ``QEMU`` you need to build a
``Linux`` kernel. We also recommend that you `put your system into a ramdisk
<booting/ramdisk>`_ first.

To distribute your systems, you need a boot-loader such as ``Syslinux``.

Automated method
----------------

The `Build.hs
<http://github.com/haskus/haskus-system-examples/tree/master/src/Build.hs>`_
program in the `haskus-system-examples
<http://github.com/haskus/haskus-system-examples>`_ repository performs many of
the previous steps automatically. For instance, it downloads, configures and
installs ``Linux`` and ``Syslinux``; it builds ramdisks; it builds ``.iso``
images; it launches ``QEMU`` with appropriate options.

This is what we use at Haskus so it works at least on our setups. Its code
should be a good reference for now. In the future we may turn it into a proper
program distributed with the ``haskus-system`` to simplify its use.
