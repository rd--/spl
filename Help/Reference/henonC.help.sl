# henonC

- _henonC(freq=22050, a=1.4, b=0.3, x0=0, x1=0)_

Henon map chaotic generator.

- freq: iteration frequency in Hertz
- a, b: equation variables
- x0: initial value of x
- x1: second value of x

A cubic-interpolating sound generator based on the difference equation:

> _x(n+2) = 1 - a * xn + 12 + b * xn_

This equation was discovered by French astronomer Michel Henon while studying the orbits of stars in globular clusters.

Default initial params:

~~~spl syn=A
henonC(
	mouseX(20, sampleRate(), 0, 0.2),
	1.4,
	0.3,
	0,
	0
) * 0.2
~~~

Mouse-control of parameters:

~~~spl syn=B
henonC(
	sampleRate() / 4,
	mouseX(1, 1.4, 0, 0.2),
	mouseY(0, 0.3, 0, 0.2),
	0,
	0
) * 0.2
~~~

Randomly modulate parameters:

~~~spl syn=C
henonC(
	sampleRate() / 8,
	lfNoise2(1) * 0.2 + 1.2,
	lfNoise2(1) * 0.15 + 0.15,
	0,
	0
) * 0.2
~~~

* * *

See also: henonL, henonN

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/HenonC.html)

Categories: Ugen, Noise, Chaos
