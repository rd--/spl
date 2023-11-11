# PinkNoise -- noise generator

_PinkNoise()_

Generates noise whose spectrum falls off in power by 3 dB per octave.
This gives equal power over the span of each octave.

	PinkNoise() * 0.1

High pass filtered:

	PinkNoise().Hpz1 * 0.1

Low pass filtered:

	PinkNoise().Lpz1 * 0.1

* * *

See also: BrownNoise, ClipNoise, GrayNoise, WhiteNoise
