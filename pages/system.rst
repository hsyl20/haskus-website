---
title: System
section: System
---

.. image:: /images/system.png
   :class: logo

Haskus system is a framework written in Haskell that can be used for system
programming. The long-term aim is to provide a full Haskell user-space
environment on top of the Linux kernel.

* `Documentation </system/doc>`_
* `Demo </system/demo/>`_
* `Sources <http://github.com/haskus/haskus-system>`_

Get started
-----------

We use ``stack`` so you should only have to execute the following commands to build the project.

.. code:: bash

    > git clone http://github.com/haskus/haskus-system
    > cd haskus-system
    > stack setup
    > stack build

Get started with system examples
--------------------------------

Examples can be found in the `haskus-system-examples
<http://github.com/haskus/haskus-system-examples>`_ repository.

.. code:: bash

   > git clone http://github.com/haskus/haskus-system-examples
   > cd haskus-system-examples
   > ./build.sh qemu2/Demo   # press enter when needed during Linux compilation

If your system has ``stack``, ``QEMU``, ``cpio`` ``gzip`` and a working
tool-chain to compile the ``Linux`` kernel, this will:

1. Download GHC and other Haskell packages as needed (relying on ``stack``)

   1. Build the ``Build`` program

   2. Build system examples

2. Execute the ``Build`` program (relying on the ``Shake`` build system)

   1. Download, configure and build the ``Linux`` kernel (press ``enter`` when
      needed during the compilation to select default options)

   2. Create a ``ramdisk`` image containing the ``Demo`` example system

   3. Execute the ``Demo`` system within ``QEMU``
