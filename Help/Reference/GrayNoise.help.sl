# GrayNoise

- _GrayNoise(mul=1, add=0)_

Noise generator.
Generates noise which results from flipping random bits in a word.
This type of noise has a high RMS level relative to its peak to peak level.
The spectrum is emphasized towards lower frequencies.

```
GrayNoise(0.125 # 2, 0)
```

High pass filtered:

```
GrayNoise(0.125 # 2, 0).Hpz1
```

High pass filtered,
modulating cutoff frequency:

```
{
	Hpf(
		GrayNoise() * 0.1,
		LfNoise2(3) * 6666 + 9999
	)
} ! 2
```

* * *

See also: BrownNoise, ClipNoise, PinkNoise, WhiteNoise

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/GrayNoise.html)

Categories: Ugen
