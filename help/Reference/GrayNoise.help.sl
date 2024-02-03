# GrayNoise -- noise generator

_GrayNoise()_
_GrayNoise(numChan=1) ≡ { GrayNoise() } ! numChan_

Generates noise which results from flipping random bits in a word.
This type of noise has a high RMS level relative to its peak to peak level.
The spectrum is emphasized towards lower frequencies.

```
GrayNoise() * 0.125
```

* * *

See also: BrownNoise, ClipNoise, PinkNoise, WhiteNoise

