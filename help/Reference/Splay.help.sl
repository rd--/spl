# Splay -- panner

- _Splay(inArray, spread=1)_
- _Splay(inArray)_ == _Splay(inArray, 1)_

Pan an array of signals at equally spaced locations across the main output channels,
as configured in Preferences.

	let k = 16;
	1:k.collect { :each |
		SinOsc(Rand(33, 333) * each, 0) * SinOsc(Rand(1 / 33, 1 / 11), 0) / k
	}.Splay

There is a special case,
where if the size of the input array is equal to the number of available channels,
the input is sent directly and no panning is performed.

* * *

See also: EqPan, Mix, Pan2, PanAz, Splay2, SplayAz
