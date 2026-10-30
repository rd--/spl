# eqPan

- _eqPan(in, pos=0)_

Equal power panner across the main output channels, as configured in `Preferences`.

- in: input signal
- pos: pan position, in range (-1, 1)

Pan pink noise:

~~~spl syn=A
eqPan(pinkNoise(), lfSaw(1 / 4, 0)) * 0.1
~~~

Sum of two panners, ie. channel-expansion at `eqPan`:

~~~spl syn=B
eqPan(
	[pinkNoise(), whiteNoise()]  / [7, 23],
	[sinOsc(1 / 7, 0), lfSaw(1 / 4, 0)]
).sum
~~~

* * *

See also: eqPan2, linPan2, pan2, panAz

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pan2.html)
