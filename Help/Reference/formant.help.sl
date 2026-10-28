# formant

- _formant(fundFreq=440, formFreq=1760, bwFreq=880)_

formant oscillator.
Generates a set of harmonics around a formant frequency at a given fundamental frequency.

- fundFreq: fundamental frequency in Hertz
- formFreq: formant frequency in Hertz
- bwFreq: pulse width frequency in Hertz

_bwFreq_ controls the bandwidth of the formant,
and must be greater than or equal to _fundFreq_.

Modulate fundamental frequency, formant freq stays constant:

```
formant(xLine(400, 1000, 8), 2000, 800) * 0.125
```

Modulate formant frequency, fundamental freq stays constant:

```
formant(200, xLine(400, 4000, 8), 200) * 0.125
```

Modulate width frequency, other freqs stay constant:

```
formant(400, 2000, xLine(800, 8000, 8)) * 0.125
```

* * *

See also: formlet

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Formant.html)

Categories: Ugen
