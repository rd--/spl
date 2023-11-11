# WhiteNoise -- noise generator

_WhiteNoise()_

Generates noise whose spectrum has equal power at all frequencies.

	WhiteNoise() * 0.1

High pass filtered:

	WhiteNoise().Hpz1 * 0.1

Low pass filtered:

	WhiteNoise().Lpz1 * 0.1

* * *

See also: BrownNoise, ClipNoise, PinkNoise, Rand, TRand
