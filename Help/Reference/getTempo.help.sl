# getTempo

- _getTempo()_

Continuous tempo.

Gives the current tempo as a control rate signal.
xTempo is always in beats per second.

`setTempo(mouseX(0.25, 4, 1, 0.2))`

Use the tempo to modulate an oscillator:

`sinOsc(400 * getTempo(), 0, 0.2)`

_Note_: Not implemented in Spl

* * *

Guides: Unit Generators

Categories: Ugen
