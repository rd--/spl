# twoPole

- _twoPole(in, freq=440, radius=0.8)_

A two pole filter.
This provides lower level access to setting of pole location.
For general purposes `resonz` is better.

- in: input signal to be processed
- freq: frequency of pole angle
- radius: radius of pole. Should be between 0 and +1

Fixed frequency:

~~~spl syn=A
twoPole(
	whiteNoise() * 0.005,
	2000,
	0.95
)
~~~

Modulate frequency:

~~~spl syn=B
twoPole(
	whiteNoise() * 0.005,
	xLine(800, 8000, 8),
	0.95
)
~~~

* * *

See also: onePole, resonz, twoZero

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/TwoPole.html)

Categories: Ugen
