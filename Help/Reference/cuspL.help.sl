# cuspL

- _cuspL(freq=22050, a=1, b=1.9, xi=0)_

Cusp map chaotic generator.

- freq: iteration frequency in Hertz
- a, b: equation variables
- xi: initial value of x

A linear-interpolating sound generator based on the difference equation:

> _x(n + 1) = a - b * sqrt(|x(n)|)_

Default values:

~~~spl syn=A
cuspL(22050, 1, 1.9, 0) * 0.1
~~~

Vary frequency:

~~~spl syn=B
cuspL(
	mouseX(20, sampleRate(), 0, 0.2),
	1,
	1.99,
	0
) * 0.1
~~~

Mouse-controlled params:

~~~spl syn=C
cuspL(
	sampleRate() / 4,
	mouseX(0.9, 1.1, 1, 0.2),
	mouseY(1.8, 2, 1, 0.2),
	0
) * 0.1
~~~

As a frequency control:

~~~spl syn=D
sinOsc(
	cuspL(
		40,
		mouseX(0.9, 1.1, 1, 0.2),
		mouseY(1.8, 2, 1, 0.2),
		0
	) * 800 + 900,
	0
) * 0.2
~~~

Filtered noise:

~~~spl syn=E
let t = dust(7).kr;
bpf(
	perc(t, 0.03, tRand(0.07, 0.35, t), -4)
	*
	cuspL(22050, 1, 1.9, 0),
	tRand(130, 450, t) * [4 7],
	1
)
~~~

* * *

See also: latoocarfianC

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/CuspL.html)

Categories: Ugen, Noise, Chaos
