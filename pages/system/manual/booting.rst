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
5. User-space program (e.g., /init)

What we build with the Haskus system is a user-space program (step 5 of the boot
sequence). Hence you first need to learn how to `build user-space programs
<booting/user_space>`_ using the Haskus system.
