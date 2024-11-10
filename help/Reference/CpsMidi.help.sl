# CpsMidi

- _CpsMidi(aNumber)_

Convert cycles per second to midi note number.

Middle C (_C4_ in scientific pitch notation) is defined to be midi note number 60.
The A above middle C has a nominal frequency of 440 hertz:

```
>>> 440.CpsMidi
69
```

Inverse of `MidiCps`:

```
SinOsc(440.CpsMidi.MidiCps, 0) * 0.1
```

* * *

See also: CpsRatio, MidiCps

References:
_Csound_
[1](https://csound.com/docs/manual/ftom.html)
_W_
[1](https://en.wikipedia.org/wiki/Scientific_pitch_notation)

Categories: Math, Ugen
