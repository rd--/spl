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
>>> [
>>> 	261.6255
>>> 	269.2918
>>> 	277.1826
>>> ].CpsMidi
[60 60.5 61]
```

The inverse is `MidiCps`:

```
>>> 440.CpsMidi.MidiCps
440
```

Quantize continuous frequency signals:

```
let freq = LfNoise2(
	[2 3]
) * [333 222] + [222 333];
SinOsc(
	freq
	.CpsMidi
	.RoundTo([2 3])
	.Lag(1E-2)
	.MidiCps,
	0
) * 0.1
```

Midi note numbers are a linear pitch space,
each twelve steps is an octave:

```
>>> [130.8 261.6 523.2].CpsMidi
[48 60 72]

>>> 48 + (12 * [0 1 2])
[48 60 72]
```

Plot over a subset of the reals:

~~~spl svg=A
(20 -- 1280).functionPlot(CpsMidi:/1)
~~~

![](sw/spl/Help/Image/CpsMidi-A.svg)

Evaluate symbolically:

```
>> CpsMidi(`x`)
(+ (* (log2 (/ x 440)) 12) 69)
```

* * *

See also: MidiCps, RatioMidi

Guides: Pitch Functions

References:
_Csound_
[1](https://csound.com/docs/manual/ftom.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/SimpleNumber.html#-cpsmidi),
_W_
[1](https://en.wikipedia.org/wiki/Scientific_pitch_notation)

Categories: Math, Ugen
