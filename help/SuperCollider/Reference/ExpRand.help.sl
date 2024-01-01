# ExpRand -- random number generator

_ExpRand(lo, hi)_

Generates a single random float value in an exponential distributions from _lo_ to _hi_.

	var n = 5;
	var freq = { ExpRand(111, 333) } ! n;
	var ampl = { ExpRand(0.05, 0.10) } ! n;
	var o = SinOsc(freq, 0) * ampl;
	o.Splay

* * *

See also: IRand, Rand, TExpRand, TRand
