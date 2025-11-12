# PinkNoise

- _PinkNoise(mul=1, add=0)_

Noise generator.
Generates noise whose spectrum falls off in power by 3 dB per octave.
This gives equal power over the span of each octave.

```
PinkNoise([0.1 0.1], 0)
```

High pass filtered:

```
PinkNoise(2 # [0.1], 0).Hpz1
```

Low pass filtered:

```
PinkNoise(2 # [0.1], 0).Lpz1
```

Compare to `WhiteNoise`:

```
[
	PinkNoise(
		0.1,
		0
	),
	WhiteNoise(
		MouseX(0.01, 0.05, 0, 0.2),
		0
	)
]
```

Shifting band-pass filter:

```
PinkNoise(2 # [0.2], 0).Bpf(
	LfNoise2(0.2).LinLin(-1, 1, 20, 3000),
	LfNoise2(0.2).LinLin(-1, 1, 0.1, 2)
)
```

* * *

See also: BrownNoise, ClipNoise, GreyNoise, WhiteNoise

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/pinkish.html)
[2](https://csound.com/docs/manual/pinker.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/PinkNoise.html),
_W_
[1](https://en.wikipedia.org/wiki/Pink_noise)

Categories: Ugen, Noise
