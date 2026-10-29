# twoZero

- _twoZero(in, freq=440, radius=0.8)_

A two zero filter.

- in: input signal to be processed
- freq: frequency of zero angle
- radius: radius of zero

Modulate frequency:

~~~spl syn=A
twoZero(
	whiteNoise() * 0.125,
	xLine(20, 20000, 8),
	1
)
~~~

* * *

See also: twoPole

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/TwoZero.html)

Categories: Ugen
