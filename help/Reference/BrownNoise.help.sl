# BrownNoise -- noise generator

_BrownNoise()_
_BrownNoise(numChan=1) ≡ { BrownNoise() } ! numChan_

Generates noise whose spectrum falls off in power by 6 dB per octave.

	BrownNoise(2) * 0.1

* * *

See also: PinkNoise, WhiteNoise
