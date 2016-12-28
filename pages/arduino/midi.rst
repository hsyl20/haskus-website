---
title: Arduino-MIDI
section: Arduino/MIDI
path0: arduino
---

Arduino-MIDI
============

Our client interconnects a Roland FR-1xb V-Accordion with a Roland E-A7 keyboard
arranger which both support the MIDI protocol.

.. image:: /images/fr1xb.jpg
    :align: right
    :width: 200px

The accordion lacks buttons to control the arranger accompaniment. Moreover our
client doesn't use the sounds of the accordion but those of the arranger but the
accordion has only buttons to select some predefined sets.

.. image:: /images/arduino_midi.jpg
    :align: right
    :width: 200px

By interconnecting an Arduino (with the Olimex SHIELD-MIDI) between the
accordion and the arranger, we have been able to map the accordion buttons to
the required arranger functions. Our client is now able to switch to a
control-mode (à la VI) on the accordion into which the note buttons can be used
to select a variation, an ending, of the accompaniment.

The overall cost of the different parts was about 50€. It is cheaper and more
versatile than the existing "MIDI event processors" (but it lacks a nice box).

Sources: https://github.com/haskus/arduino-midi
