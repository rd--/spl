# Formant

- _Formant(fundFreq, formFreq, widthFreq)_

Formant oscillator.
Generates a set of harmonics around a formant frequency at a given fundamental frequency.

- fundFreq: fundamental frequency in Hertz
- formFreq: formant frequency in Hertz
- widthFreq: pulse width frequency in Hertz.
  Controls the bandwidth of the formant

_widthFreq_ must be greater than or equal to _fundFreq_.

Modulate fundamental frequency, formant freq stays constant:

```
Formant(XLine(400, 1000, 8), 2000, 800) * 0.125
```

Modulate formant frequency, fundamental freq stays constant:

```
Formant(200, XLine(400, 4000, 8), 200) * 0.125
```

Modulate width frequency, other freqs stay constant:

```
Formant(400, 2000, XLine(800, 8000, 8)) * 0.125
```

* * *

See also: Formlet

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Formant.html)

Categories: Ugen
