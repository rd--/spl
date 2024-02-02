# RandRange -- random number generator

_RandRange(lo, hi)_

Generates random numbers between _lo_ and _hi_.

White noise:

	let n = LfNoise2(1 / 3).Range(0.01, 0.1);
	RandRange([Dc(-0.05), 0 - n], [Dc(0.05), n])

Noise between to low frequency oscillators:

	RandRange(SinOsc(0.1, 0), SinOsc(0.42, 0)) * 0.1

* * *

See also: Rand, TRand, WhiteNoise
