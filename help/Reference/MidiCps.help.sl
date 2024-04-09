# MidiCps

- _MidiCps(aNumber)_

Convert midi note number to cycles per second.

Middle C (_C4_ in scientific pitch notation) is defined to be midi note number 60.
The A above middle C  has a nominal frequency of 440 hertz:

```
>>> 69.MidiCps
440
```

Inverse of `CpsMidi`.

```
Saw(Line(24, 108, 10).MidiCps) * 0.1
```

* * *

See also: MidiRatio

References:
_Csound_
[1](https://csound.com/docs/manual/mtof.html)

Categories: Arithmetic
