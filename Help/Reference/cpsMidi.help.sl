# cpsMidi

- _cpsMidi(x)_

Convert cycles per second to midi note number.

Middle C (_C4_ in scientific pitch notation) is defined to be midi note number 60.
The A above middle C has a nominal frequency of 440 hertz:

```
>>> 440.cpsMidi
69
```

Threads over lists and answers fractional values:

```
>>> [
>>> 	261.6255
>>> 	269.2918
>>> 	277.1826
>>> ].cpsMidi
[60 60.5 61]
```

The inverse is `midiCps`:

```
>>> 440.cpsMidi.midiCps
440
```

Quantize continuous frequency signals:

~~~spl syn=A
let freq = lfNoise2(
	[2 3]
) * [333 222] + [222 333];
sinOsc(
	freq
	.cpsMidi
	.round([2 3])
	.lag(1E-2)
	.midiCps,
	0
) * 0.1
~~~

Midi note numbers are a linear pitch space,
each twelve steps is an octave:

```
>>> [130.8 261.6 523.2].cpsMidi
[48 60 72]

>>> 48 + (12 * [0 1 2])
[48 60 72]
```

Plot over a subset of the reals:

~~~spl svg=A
(20 -- 1280).functionPlot(cpsMidi/1)
~~~

![](Help/Image/cpsMidi-A.svg)

Evaluate symbolically:

```
>> cpsMidi(`x`)
(+ (* (log (/ x 440) 2) 12) 69)
```

* * *

See also: midiCps, ratioMidi

Guides: Pitch Functions, Tuning Functions, Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/ftom.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/SimpleNumber.html#-cpsmidi),
_W_
[1](https://en.wikipedia.org/wiki/Scientific_pitch_notation)

Categories: Math, Ugen
