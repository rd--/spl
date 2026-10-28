# lfCub

- _lfCub(freq, iphase)_

Oscillator.
A sine like shape made of two cubic pieces.
Smoother than `lfPar`.

- freq: frequency in Hertz
- iphase: initial phase offset, range=[0, 2]

As frequency modulator:

```
lfCub(lfCub(0.2, 0) * 400 + 800, 0) * 0.1
```

As nested frequency modulator:

```
lfCub(
	lfCub(
		lfCub(0.2, 0) * 8 + 10,
		0
	) * 400 + 800,
	0
) * 0.1
```

Frequency sweep:

```
lfCub(xLine(100, 8000, 30), 0) * 0.1
```

* * *

See also: lfPar

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LFPar.html)

Categories: Ugen, Oscillator
