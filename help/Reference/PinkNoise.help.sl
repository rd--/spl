# PinkNoise -- noise generator

_PinkNoise()_
_PinkNoise(numChan=1) ≡ { PinkNoise() } ! numChan_

Generates noise whose spectrum falls off in power by 3 dB per octave.
This gives equal power over the span of each octave.

```
PinkNoise(2) * 0.1
```

High pass filtered:

```
PinkNoise(2).Hpz1 * 0.1
```

Low pass filtered:

```
PinkNoise(2).Lpz1 * 0.1
```

* * *

See also: BrownNoise, ClipNoise, GrayNoise, WhiteNoise
