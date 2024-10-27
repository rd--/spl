# WhiteNoise

- _WhiteNoise()_
- _WhiteNoise(mul, add)_ => _{ WhiteNoise() } ! mul.size * mul + add_

Generates noise whose spectrum has equal power at all frequencies.

De-correlated stereo white noise:

```
WhiteNoise(0.1 # 2, 0)
```

High pass filtered:

```
WhiteNoise(0.1 # 2, 0).Hpz1
```

Low pass filtered:

```
WhiteNoise(0.1 # 2, 0).Lpz1
```

* * *

See also: BrownNoise, ClipNoise, PinkNoise, Rand, TRand

References:
_Csound_
[1](https://csound.com/docs/manual/noise.html),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/WhiteNoiseProcess.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/WhiteNoise.html),
_W_
[1](https://en.wikipedia.org/wiki/White_noise)

Categories: Ugen, Noise
