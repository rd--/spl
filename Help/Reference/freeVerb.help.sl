# freeVerb

- _freeVerb(in, mix=0.33, room=0.5, damp=0.5)_

A reverb.

- in: input signal
- mix: 0 = dry, 1 = wet
- room: room size (0, 1)
- damp: high frequency damping (0, 1)

Reverberate decaying impulse shaped cubic oscillator:

~~~spl syn=A
freeVerb(
	decay(
		impulse([1, 1 / 3], 0),
		0.25
	) * lfCub([1200, 700], 0) * 0.1,
	mouseX(0, 1, 0, 0.2),
	mouseY(0, 1, 0, 0.2),
	lfNoise2(0.1).linLin(-1, 1, 0, 1)
)
~~~

* * *

See also: freeVerb2, gVerb

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/FreeVerb.html)

Categories: Ugen
