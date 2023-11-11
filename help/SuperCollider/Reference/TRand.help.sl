# TRand -- triggered random number generator

_TRand(lo=0, hi=1, trig=0)_ == _Rand(trig=0, lo=0, hi=1)_

Generates a random float value in uniform distribution from lo to hi each time the trig signal changes from nonpositive to positive values

	var tr = Dust(10);
	SinOsc(Rand(tr, 300, 3000), 0) * 0.1

Mouse controls density:

	var tr = Dust(MouseX(1, 8000, 1, 0.2));
	SinOsc(Rand(tr, 300, 3000), 0) * 0.1

* * *

See also: _Rand_, _TrIRand_

