# GrayNoise

- _GrayNoise()_
- _GrayNoise(mul, add) ≡ { GrayNoise() } ! mul.size * mul + add_

Noise generator.
Generates noise which results from flipping random bits in a word.
This type of noise has a high RMS level relative to its peak to peak level.
The spectrum is emphasized towards lower frequencies.

```
GrayNoise() * 0.125
```

* * *

See also: BrownNoise, ClipNoise, PinkNoise, WhiteNoise

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/GrayNoise.html)

Categories: Ugen
