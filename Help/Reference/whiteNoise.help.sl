# whiteNoise

- _whiteNoise(mul=1, add=0)_

Generates noise whose spectrum has equal power at all frequencies.

De-correlated stereo white noise:

```
whiteNoise([0.1 0.1], 0)
```

High pass filtered:

```
whiteNoise([0.1] # 2, 0).hpz1
```

Low pass filtered:

```
whiteNoise([0.1] # 2, 0).lpz1
```

* * *

See also: brownNoise, clipNoise, greyNoise, pinkNoise, rand, tRand

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
