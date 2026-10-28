# pinkNoise

- _pinkNoise(mul=1, add=0)_

Noise generator.
Generates noise whose spectrum falls off in power by 3 dB per octave.
This gives equal power over the span of each octave.

```
pinkNoise([0.1 0.1], 0)
```

High pass filtered:

```
pinkNoise([0.1] # 2, 0).hpz1
```

Low pass filtered:

```
pinkNoise([0.1] # 2, 0).lpz1
```

Compare to `whiteNoise`:

```
[
	pinkNoise(
		0.1,
		0
	),
	whiteNoise(
		mouseX(0.01, 0.05, 0, 0.2),
		0
	)
]
```

Shifting band-pass filter:

```
pinkNoise([0.2] # 2, 0).bpf(
	lfNoise2(0.2).linLin(-1, 1, 20, 3000),
	lfNoise2(0.2).linLin(-1, 1, 0.1, 2)
)
```

* * *

See also: brownNoise, clipNoise, greyNoise, whiteNoise

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
