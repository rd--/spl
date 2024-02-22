# WhiteNoise

- _WhiteNoise()_
- _WhiteNoise(numChan=1)_ => _{ WhiteNoise() } ! numChan_

Generates noise whose spectrum has equal power at all frequencies.

```
WhiteNoise(2) * 0.1
```

High pass filtered:

```
WhiteNoise(2).Hpz1 * 0.1
```

Low pass filtered:

```
WhiteNoise(2).Lpz1 * 0.1
```

* * *

See also: BrownNoise, ClipNoise, PinkNoise, Rand, TRand

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/WhiteNoise.html)

Categories: Noise
