# Splay -- panner

Pan an array of signals at equally spaced locations across the main output channels,
as configured in Preferences.

	(1 .. 9).collect { :each |
		SinOsc(Rand(33, 111) * each, 0) * SinOsc(Rand(1 / 33, 1 / 11), 0) * 0.1
	}.Splay

* * *

See also: EqPan, Mix, Pan2, Splay2, SplayAz
