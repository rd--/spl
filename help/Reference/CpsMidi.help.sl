# CpsMidi

- _CpsMidi(aNumber)_

Convert cycles per second to midi note number.

Middle C (_C4_ in scientific pitch notation) is defined to be midi note number 60.
The A above middle C has a nominal frequency of 440 hertz:

```
>>> 440.CpsMidi
69
```

Threads over lists and answers fractional values:

```
>>> [261.6255 269.2918 277.1826].CpsMidi
[60 60.5 61]
```

The inverse is `MidiCps`:

```
>>> 440.CpsMidi.MidiCps
440
```

Quantize continuous frequency signals:

```
let f = LfNoise2([2 3]) * [333 222] + [222 333];
SinOsc(f.CpsMidi.RoundTo([2 3]).Lag(1E-2).MidiCps, 0) * 0.1
```

* * *

See also: CpsRatio, MidiCps

References:
_Csound_
[1](https://csound.com/docs/manual/ftom.html)
_W_
[1](https://en.wikipedia.org/wiki/Scientific_pitch_notation)

Categories: Math, Ugen
