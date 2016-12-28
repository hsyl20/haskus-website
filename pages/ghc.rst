---
title: GHC
section: GHC
---

GHC developments
================

.. image:: /images/haskell-logo.png
   :class: logo


We contribute to the development of the main Haskell compiler: GHC_

.. _GHC: http://www.haskell.org/ghc

Our contributions
-----------------

We have already fixed several bugs and added several features as you can see in
the following list. If you need specific developments using GHC or to improve
it, don't hesitate to `contact us`_. If you want to help us continue to improve GHC,
consider subscribing_.

.. _subscribing: /subscribe
.. _`contact us`: /contact

.. contents::
   :local:

------

2016-12 -- Remove GHC's static flags
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GHC was using "static flags", i.e., flags whose values are accessed through
"global variables". We converted them into dynamic flags. Some of them still use
some kind of global variables but at least they can be set before the first use
of the GHC API.

Ticket `#8440`_

.. _#8440: https://ghc.haskell.org/trac/ghc/ticket/8440

------

2016-11 -- Scrutinee Constant Folding
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We added constant folding into case expressions. For instance the following
code:

.. code:: haskell

    main = case t of t0
       0##     -> ...
       DEFAULT -> case t0 -# 1## of t1
          0##    -> ...
          DEFAUT -> case t1 -# 1## of t2
             0##     -> ...
             DEFAULT -> case t2 -# 1## of _
                0##     -> ...
                DEFAULT -> ...

now becomes:

.. code:: haskell

    main = case t of _
       0## -> ...
       1## -> ...
       2## -> ...
       3## -> ...
       DEFAULT -> ...

Ticket `#12877`_

.. _#12877: https://ghc.haskell.org/trac/ghc/ticket/12877

------

2016-11 -- ``-fhide-source-paths`` flag
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We added a ``-fhide-source-paths`` flag to GHC to reduce the line noise when
compiling many modules.
  
Tickets `#12807`_ and `#12851`_

.. _#12807: https://ghc.haskell.org/trac/ghc/ticket/12807
.. _#12851: https://ghc.haskell.org/trac/ghc/ticket/12851

------

2016-11 -- Fix float out bug
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Using pattern synonyms and view patterns in the GHC codebase triggered a bug
because the float-out optimisation was allowed to float-out levity polymorphic
expressions.

Ticket `#12901`_

.. _#12901: https://ghc.haskell.org/trac/ghc/ticket/12901


------

2016-11 -- Fix RTS linker bug with 64-bit symbol tables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The RTS linker wasn't skipping 64-bit symbol table entries. We fixed this.

Ticket `#12827`_

.. _#12827: https://ghc.haskell.org/trac/ghc/ticket/12827


------

2016-10 -- Check foreign primop imports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Foreign primop imports were not checked if the given entity string was empty.
The latter triggered an error in the assembler phase (jump to an empty label).
We fixed this by using the function name as a label when the entity string is
missing (the ``ccall`` convention has this behavior, in accordance with the
Haskell 2010 report).

Ticket `#12355`_

.. _#12355: https://ghc.haskell.org/trac/ghc/ticket/12355


------

2016-10 -- Uninstall GHC signal handlers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GHC wasn't properly uninstalling its signal handlers. It is problematic when
using the GHC API so we fixed it.

Ticket `#4162`_

.. _#4162: https://ghc.haskell.org/trac/ghc/ticket/4162


------

2016-09 -- Fix foreign call argument overwriting
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GHC was sometimes generating bad assembly code for passing arguments to foreign
calls (call into C code for instance): the arguments were corrupted. We fixed
this.

Tickets `#11792`_ and `#12614`_

.. _#11792: https://ghc.haskell.org/trac/ghc/ticket/11792
.. _#12614: https://ghc.haskell.org/trac/ghc/ticket/12614

------

2016-04 -- Rework PThread based RTS ticker
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The RTS ticker thread wasn't properly disabled when in STOPPED state. We
designed an algorithm using `double-checked locking`_ that was then implemented
by Ben Gamari to solve this issue.

Ticket `#11965`_

.. _`double-checked locking`: https://en.wikipedia.org/wiki/Double-checked_locking
.. _#11965: https://ghc.haskell.org/trac/ghc/ticket/11965


------

2016-02 -- Use ``timerfd`` on Linux
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GHC runtime system (RTS) used alarm signals to implement green threads
scheduling. Signals are problematic because they can interrupt system calls
(syscalls) and the user-code can mess up with them. We modified GHC's RTS so
that it uses the ``timerfd`` syscall on Linux instead of alarm signals.

Tickets `#10840`_

.. _#10840: https://ghc.haskell.org/trac/ghc/ticket/10840


------

2015-11 -- Fix "link info" ELF section
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GHC stores information about each build in a ELF section but it wasn't following
the ELF specification while doing so ("note" sections have to follow some rules
that weren't followed). We fixed this by making GHC follow the spec.

GHC used "readelf" program to read the contents of this section back. It was
problematic, especially with the previous fix so we replaced it with a direct
extraction of the ELF section by using ``Data.Binary.Get``

Tickets `#11022`_ and `#10974`_

.. _#11022: https://ghc.haskell.org/trac/ghc/ticket/11022
.. _#10974: https://ghc.haskell.org/trac/ghc/ticket/10974


------

2015-10 -- Detect use of foreign primops in GHCi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Currently GHCi cannot use foreign primops but this wasn't checked, leading to
GHC panics. We implemented the check.

Ticket `#10462`_

.. _#10462: https://ghc.haskell.org/trac/ghc/ticket/10462

------

2015-06 -- Fix RTS linker allocation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GHC's runtime system linker needs to allocate memory in the low 2GB of the
memory (so that 32-bit relative addresing can be used). GHC was using one
``mmap`` call per object in archive files (``.a``) wasting a lot of memory space
(``mmap`` allocates full memory pages even for small objects) and
time (``mmap`` call is costly).

We implemented an allocator named ``M32 allocator`` that loads several objects
into the same memory page. Our code has been `manually merged by Simon Marlow`_
into another patch that has been applied.

Ticket `#9314`_

.. _`manually merged by Simon Marlow`: https://ghc.haskell.org/trac/ghc/ticket/9314#comment:26
.. _#9314: https://ghc.haskell.org/trac/ghc/ticket/9314

------

2015-05 -- Allow execution of static programs in initramfs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GHC can compile statically linked programs. However, the produced binary was
infinitely looping if it couldn't find the ``iconv`` files (used to convert
between character sets). We stumbled on this while trying to use a static binary
into an ``initramfs`` image. We helped in fixing this.

Tickets `#7695`_ and `#10298`_

.. _#7695: https://ghc.haskell.org/trac/ghc/ticket/7695
.. _#10298: https://ghc.haskell.org/trac/ghc/ticket/10298
