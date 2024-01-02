# TRand -- triggered random number generator

_TRand(lo=0, hi=1, trig=0)_

Generates a random float value in uniform distribution from _lo_ to _hi_ each time the _trig_ is set.

	var tr = Dust(10);
	SinOsc(TRand(300, 3000, tr), 0) * 0.1

Mouse controls density:

	var tr = Dust(MouseX(1, 8000, 1, 0.2));
	SinOsc(TRand(300, 3000, tr), 0) * 0.1

* * *

See also: IRand, Rand, TiRand
