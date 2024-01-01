# Rand -- random number generator

- _Rand(lo, hi)_

Generates a single random float value in uniform distribution from lo to hi.
It generates this when the SynthDef first starts playing, and remains fixed.

	{
		var freq = Rand(200, 800);
		var dur = (1 / freq) * 7500;
		SinOsc(freq, 0) * Line(0.2, 0, 1)
	} !^ 5

* * *

See also: [Random Number Generators], Rand0, Rand2, TRand, WhiteNoise
