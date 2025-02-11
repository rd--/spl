# ClipNoise

- _ClipNoise()_
- _ClipNoise(mul=1, add=0)_ ⟹ _{ ClipNoise() } ! mul.shape * mul + add_

Noise generator.
Generates noise whose values are either -1 or 1.
This produces the maximum energy for the least peak to peak amplitude.

```
ClipNoise(0.05 # 2, 0)
```

* * *

See also: BrownNoise, GrayNoise, PinkNoise, WhiteNoise

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/ClipNoise.html)

Categories: Ugen, Noise
