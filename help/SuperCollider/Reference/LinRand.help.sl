# LinRand -- random number generator

- _LinRand(input)_
- _LinRand(lo=0, hi=1, minmax=0)_

Unary form generates noise with a linear distribution between _0_ and _input_.

	LinRand(SinOsc(0.1, 0)) * 0.1

The below is zero when _input_ is positive:

	var n = LinRand(SinOsc(1 / 2, 0)) * 0.1;
	n.Abs - n

Ternary form generates a single random float value in linear distribution from _lo_ to _hi_, skewed towards _lo_ if _minmax_ `< 0`, otherwise skewed towards _hi_.

	var minmax = MouseX(0, 1, 0, 0.2);
	{
		var freq = LinRand(200, 10000, minmax);
		var dur = (1 / freq) * 7500;
		FSinOsc(freq, 0) * Line(0.2, 0, dur)
	} !^ 15

* * *

See also: BiLinRand, IRand, NRand, Rand, Rand2
