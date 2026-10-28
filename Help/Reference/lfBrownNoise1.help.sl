# lfBrownNoise1

- _lfBrownNoise1(freq=20, dev=1, dist=0)_

Noise generator.
Random walk with Gendyn distributions.

- freq: approximate rate at which to generate random values
- dev: scale maximum step (0-1)
- dist: Gendyn distribution to use (0-5: see gendy1 for details)

As audio signal:

```
lfBrownNoise1(
	1000,
	1,
	mouseX(0, 5, 0, 0.2)
) * 0.1
```

As frequency control:

```
sinOsc(
	lfBrownNoise1(
		[[3 11]] # 8,
		0.2,
		2
	) * 400 + 450,
	0
).mix * 0.1
```

* * *

See also: brownNoise, lfBrownNoise0, lfBrownNoise2

Guides: Unit Generators

Categories: Ugen
