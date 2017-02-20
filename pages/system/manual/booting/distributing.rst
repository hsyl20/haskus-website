---
title: Documentation
section: Documentation
path0: system
---

Distributing your system
========================

To distribute your systems, we will create a directory ``/my/disk`` containing:

* your `system </system/manual/booting/building>`_ (in a `ramdisk
  </system/manual/booting/ramdisk>`_)
* the `Linux kernel </system/manual/booting/linux>`_
* the boot-loader files (including its configuration)

A boot-loader is needed as it loads `Linux </system/manual/booting/linux>`_ and
the `ramdisk containing your system </system/manual/booting/ramdisk>`_. We use
the `Syslinux <http://syslinux.org>`_ boot-loader but you can use others such as
GRUB. Note that you don't need a boot-loader when you `test your system with
QEMU </system/manual/booting/QEMU>`_ because QEMU acts as a boot-loader itself.

To distribute your systems, you can install the boot-loader on a device (e.g.,
USB stick) and copy the files in the ``/my/disk`` directory on it. Or you can
also create a ``.iso`` image to burn on a CD-ROM (or to distribute online).


Downloading Syslinux
--------------------

You first need to download an unpack the Syslinux boot-loader:

.. code:: bash

   wget http://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.xz
   tar xf syslinux-6.03.tar.xz


Creating the disk directory
---------------------------

You need to execute the following steps to create your disk directory:

Create the disk directories:

.. code:: bash

   mkdir -p /my/disk/boot/syslinux

Copy Syslinux in it:

.. code:: bash

   find syslinux-6.03/bios *.c32 -exec cp {} /my/disk/boot/syslinux ;
   cp syslinux-6.03/bios/core/isolinux.bin /my/disk/boot/syslinux/

Copy the `Linux kernel </system/manual/booting/linux>`_ in it:

.. code:: bash

   cp linux-4.9.8.bin /my/disk/boot/

Copy the `system ramdisk </system/manual/booting/ramdisk>`_ in it:

.. code:: bash

   cp myimage.img /my/disk/boot/

Finally, we need to configure the boot-loader by creating a file
``/my/disk/boot/syslinux/syslinux.cfg`` containing:

.. code::

   DEFAULT main
   PROMPT 0
   TIMEOUT 50
   UI vesamenu.c32
   
   LABEL main
   MENU LABEL MyOS
   LINUX  /boot/linux-4.9.8.bin
   INITRD /boot/myimage.img
   APPEND rdinit="/my/system"

Replace ``/my/system`` with the path of your system in the ``myimage.img``
ramdisk.


Creating a bootable device
--------------------------

To create a bootable device (e.g., bootable USB stick), you have to know its
device path. Say ``/dev/XXX``.

You have to install Syslinux on it once:

.. code:: bash

   sudo syslinux-6.03/bios/linux/syslinux -iam -d /boot/syslinux /dev/XXX 

Then you have to copy the contents of the disk directory on it:

.. code:: bash

   sudo mount /dev/XXX /mnt/SOMEWHERE
   cp -rf /my/disk/* /mnt/SOMEWHERE
   sudo umount /mnt/SOMEWHERE

Now your device should be bootable!


Creating a bootable CD-ROM
--------------------------

To create a bootable CD-ROM, you first need to create a ``.iso`` disk image with the ``xorriso`` utility:

.. code:: bash

   xorriso -as mkisofs
      -R -J                            # use Rock-Ridge/Joliet extensions
      -o mydisk.iso                    # output ISO file
      -c boot/syslinux/boot.cat        # create boot catalog
      -b boot/syslinux/isolinux.bin    # bootable binary file
      -no-emul-boot                    # doesn't use legacy floppy emulation
      -boot-info-table                 # write additional Boot Info Table (required by SysLinux)
      -boot-load-size 4
      -isohybrid-mbr syslinux-6.03/bios/mbr/isohdpfx_c.bin  # hybrid ISO
      /my/disk

It should create a ``mydisk.iso`` file that you can burn on a CD or distribute.

Automated method
================

The `Build.hs
<http://github.com/haskus/haskus-system-examples/tree/master/src/Build.hs>`_
program in the `haskus-system-examples
<http://github.com/haskus/haskus-system-examples>`_ repository can do some of
the steps above automatically for the examples.

To create the disk directory for a system (e.g., ``Demo``), use :

.. code:: bash

   ./build.sh disk/Demo

It automatically downloads and configures Syslinux and it copies files as
described above. The resulting disk directory is located at
``_build/disks/Demo/``.

To create an ISO image, use:

.. code:: bash

   ./build.sh _build/isos/Demo.iso

You can also directly create an ISO image and test it with QEMU:

.. code:: bash

   ./build.sh iso/Demo

This is the best way we have found to test the Syslinux configuration in a
virtual environment.
