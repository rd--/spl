# WhiteNoise

- _WhiteNoise(mul=1, add=0)_

Generates noise whose spectrum has equal power at all frequencies.

De-correlated stereo white noise:

```
WhiteNoise([0.1 0.1], 0)
```

High pass filtered:

```
WhiteNoise(2 # [0.1], 0).Hpz1
```

Low pass filtered:

```
WhiteNoise(2 # [0.1], 0).Lpz1
```

* * *

See also: BrownNoise, ClipNoise, GreyNoise, PinkNoise, Rand, TRand

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/noise.html)
[2](https://csound.com/docs/manual/rand.html),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/WhiteNoiseProcess.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/WhiteNoise.html),
_W_
[1](https://en.wikipedia.org/wiki/White_noise)

Categories: Ugen, Noise
