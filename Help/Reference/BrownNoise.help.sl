# BrownNoise

- _BrownNoise()_
- _BrownNoise(mul=1, add=0)_ ⟹ _{ BrownNoise() } ! mul.shape * mul + add_

Generates noise whose spectrum falls off in power by 6 dB per octave.

Quiet stereo de-correlated brown noise:

```
BrownNoise(0.1 # 2, 0)
```

High pass filtered:

```
BrownNoise(0.1 # 2, 0).Hpz1
```

* * *

See also: PinkNoise, WhiteNoise

References:
_Csound_
[1](https://csound.com/docs/manual/fractalnoise.html),
_Mathematica_
[1](https://mathworld.wolfram.com/BrownianMotion.html)
[1](https://reference.wolfram.com/language/ref/WienerProcess.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/BrownNoise.html),
_W_
[1](https://en.wikipedia.org/wiki/Brownian_noise)

Categories: Ugen, Noise
