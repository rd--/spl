# ExpRand -- random number generator

_ExpRand(lo, hi)_

Generates a single random float value in an exponential distributions from _lo_ to _hi_.

	let n = 5;
	let freq = { ExpRand(111, 333) } ! n;
	let ampl = { ExpRand(0.05, 0.10) } ! n;
	let o = SinOsc(freq, 0) * ampl;
	o.Splay

* * *

See also: IRand, Rand, TExpRand, TRand
