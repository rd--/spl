# CpsMidi

Convert cycles per second to midi note.

Inverse of `MidiCps`:

```
SinOsc(440.CpsMidi.MidiCps, 0) * 0.1
```

A4 = 440:

```
>>> 440.CpsMidi
69
```

* * *

See also: CpsRatio, MidiCps

References:
_Csound_
[1](https://csound.com/docs/manual/ftom.html)

Categories: Ugen, Arithmetic
