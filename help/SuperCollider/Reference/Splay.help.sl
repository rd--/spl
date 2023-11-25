# Splay -- panner

Pan an array of signals at equally spaced locations across the main output channels,
as configured in Preferences.

	var k = 16;
	(1 .. k).collect { :each |
		SinOsc(Rand(33, 333) * each, 0) * SinOsc(Rand(1 / 33, 1 / 11), 0) / k
	}.Splay

* * *

See also: EqPan, Mix, Pan2, PanAz, Splay2, SplayAz
