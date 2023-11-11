# TRand -- triggered random number generator

_TRand(lo=0, hi=1, trig=0)_

Generates a random float value in uniform distribution from lo to hi each time the trig signal changes from nonpositive to positive values

This is usually written as _Rand_, i.e.

	var tr = Dust(10);
	SinOsc(Rand(tr, 300, 3000), 0) * 0.1

Mouse controls density:

	var tr = Dust(MouseX(1, 8000, 1, 0.2));
	SinOsc(Rand(tr, 300, 3000), 0) * 0.1

* * *

See also: IRand, Rand, TiRand
