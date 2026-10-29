# splay

- _splay([s₁ s₂ …], spread=1)_

Pan a list of signals at equally spaced locations across the main output channels,
as configured in `Preferences`.

~~~spl syn=A
let k = 16;
1:k.collect { :each |
	sinOsc(
		rand(33, 333) * each,
		0
	) * sinOsc(
		rand(1 / 33, 1 / 11),
		0
	) / k
}.splay
~~~

There is a special case,
where if the size of the input list is equal to the number of available channels,
the input is sent directly and no panning is performed.

* * *

See also: eqPan, mix, pan2, panAz, splay2, splayAz

Guides: Unit Generators

Categories: Panner
