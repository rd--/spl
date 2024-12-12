# AmpComp

- _AmpComp(freq, root, exp=1/3)_

Psychoacoustic amplitude compensation.
Implements the (optimized) formula:

> _compensationFactor = (root / freq) ^ exp_

compensating for higher frequencies normally being perceived as louder.

- freq: input frequency value. When _freq = root_, the output is 1
- root: root frequency relative to which the curve is calculated (usually lowest frequency)
- exp: exponent, how steep the curve decreases for increasing freq

Note that for frequencies very much smaller than root the amplitudes can become very high.
In this case limit the freq with _freq.Max(minval)_, or use `AmpCompA`.

Compare a sine tone with and without amplitude compensation:

```
let freq = MouseX(300, 15000, 1, 0.2);
let osc = SinOsc(freq, 0) * 0.1;
[
	osc,
	osc * AmpComp(freq, 300, 1 / 3).kr
]
```

Different sounds cause quite different loudness perception,
and the desired musical behavior can vary,
so the exponent can be tuned:

```
let freq = MouseX(300, 15000, 1, 0.2);
let mul = AmpComp(freq, 300, 4 / 3).kr;
Pulse(freq, 0.5) * mul * 0.1
```

* * *

See also: AmpCompA

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/AmpComp.html)

Categories: Ugen
