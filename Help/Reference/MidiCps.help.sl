# MidiCps

- _MidiCps(aNumber)_

Convert midi note number to cycles per second.

Middle C (_C4_ in scientific pitch notation) is defined to be midi note number 60.

The A above middle C has a nominal frequency of 440 hertz:

```
>>> 69.MidiCps
440
```

Threads over lists and fractional values are allowed:

```
>>> [60 60.5 61].MidiCps
[261.6255 269.2918 277.1826]
```

Oscillator frequency sweep specified in midi note numbers:

```
Saw(
	Line(24, 108, 10).MidiCps
) * 0.1
```

The inverse is `CpsMidi`:

```
>>> 69.MidiCps.CpsMidi
69
```

Midi note numbers are a linear pitch space,
each twelve steps is an octave:

```
>>> [48 60 72].MidiCps
[130.8 261.6 523.2]

>>> 130.8 * [1 2 4]
[130.8 261.6 523.2]
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 100).functionPlot(MidiCps:/1)
~~~

![](sw/spl/Help/Image/MidiCps-A.svg)

Evaluate symbolically:

```
>> MidiCps(`x`)
(* 440 (^ 2 (/ (- x 69) 12)))
```

* * *

See also: CpsMidi, MidiRatio

Guides: Pitch Functions

References:
_Csound_
[1](https://csound.com/docs/manual/mtof.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/SimpleNumber.html#-midicps)

Categories: Arithmetic
