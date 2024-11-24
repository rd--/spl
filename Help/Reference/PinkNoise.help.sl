# PinkNoise

- _PinkNoise()_
- _PinkNoise(mul, add) ≡ { PinkNoise() } ! mul.size * mul + add_

Noise generator.
Generates noise whose spectrum falls off in power by 3 dB per octave.
This gives equal power over the span of each octave.

```
PinkNoise(0.1 # 2, 0)
```

High pass filtered:

```
PinkNoise(0.1 # 2, 0).Hpz1
```

Low pass filtered:

```
PinkNoise(0.1 # 2, 0).Lpz1
```

Compare to `WhiteNoise`:

```
[
	PinkNoise() * 0.1,
	WhiteNoise() * MouseX(0.01, 0.05, 0, 0.2)
]
```

* * *

See also: BrownNoise, ClipNoise, GrayNoise, WhiteNoise

References:
_Csound_
[1](https://csound.com/docs/manual/pinkish.html)
[2](https://csound.com/docs/manual/pinker.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/PinkNoise.html)

Categories: Ugen, Noise
