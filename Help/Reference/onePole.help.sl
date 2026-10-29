# onePole

- _onePole(in, coef=0.5)_

A one pole filter.

- in: input signal to be processed
- coef: feedback coefficient. Should be between -1 and +1

Implements the formula:

> _y[n] = (1 - |α|) x[n] + α x[n-1]_

Low pass:

~~~spl syn=A
onePole(whiteNoise() * 0.2, 0.95)
~~~

High pass:

~~~spl syn=B
onePole(whiteNoise() * 0.2, -0.95)
~~~

Modulate coeficient:

~~~spl syn=C
onePole(
	whiteNoise() * 0.2,
	line(0.95, -0.95, 10)
)
~~~

* * *

See also: oneZero, twoPole

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/OnePole.html)

Categories: Ugen
