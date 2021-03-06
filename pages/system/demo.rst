---
title: Demo
section: System/Demo
path0: system
---

Examples & Demo
===============

2016-08-18 - First real boot (clock example)
--------------------------------------------

This is the first time I boot a demo using ``haskus-system`` (called ViperVM at the
time) on a real computer (an old notebook). The demo displays a clock
dynamically rendered with ``Diagrams`` and its ``Rasterific`` backend. It uses
``haskus-system`` to directly access Linux's DRM subsystem from Haskell.

.. raw:: html

    <div style="text-align:center">
        <iframe height="315" width="560" allowfullscreen
    frameborder="0" src="https://www.youtube.com/embed/O6lGMM_tvmU">
        </iframe>
    </div>

2016-04-18 - Drawing and input
------------------------------

Demo showing a working environment tested with ``QEMU``. It uses the input system to
detect mouse moves and clicks and the graphics system to render on the screen.
The user-space code is 99% Haskell thanks to ``haskus-system`` (called ViperVM at the
time). The remaining 1% is GHC's runtime system and its dependencies.

The yellowish background is \"generated\" directly; the ugly logo with an alpha
shadow is read from a PNG image file with ``JuicyPixels``; the path and the cursor
are generated with ``Rasterific``. The different elements are manually blended in
the frame buffer.

.. raw:: html

    <div style="text-align:center">
        <iframe height="315" width="560" allowfullscreen
    frameborder="0" src="https://www.youtube.com/embed/0luma-lwlaM">
        </iframe>
    </div>
