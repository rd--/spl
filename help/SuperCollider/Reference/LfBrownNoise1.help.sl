# LfBrownNoise1 -- noise generator

Random walk with Gendyn distributions.

_LfBrownNoise1(freq=20, dev=1, dist=0)_

- freq: approximate rate at which to generate random values
- dev: scale maximum step (0-1)
- dist: Gendyn distribution to use (0-5: see Gendy1 for details)

As audio signal:

	LfBrownNoise1(1000, 1, MouseX(0, 5, 0, 0.2)) * 0.1

As frequency control:

	SinOsc(
		LfBrownNoise1([3 11] ! 8, 0.2, 2) * 400 + 450,
		0
	).Mix * 0.1

* * *

See also: BrownNoise, LfBrownNoise0, LfBrownNoise2
