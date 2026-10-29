# standardL

- _standardL(freq=22050, k=1, xi=0.5, yi=0)_

Standard map chaotic generator.
The standard map is an area preserving map of a cylinder discovered by the plasma physicist Boris Chirikov.

- freq: Iteration frequency in Hertz
- k: Perturbation amount
- xi: Initial value of x
- yi: Initial value of y

Vary frequency:

~~~spl syn=A
standardL(
	mouseX(20, sampleRate(), 0, 0.2),
	1,
	0.5,
	0
) * 0.1
~~~

Mouse-controlled _k_ parameter:

~~~spl syn=B
standardL(
	sampleRate() / 2,
	mouseX(0.9, 4, 0, 0.2),
	0.5,
	0
) * 0.1
~~~

As frequency control:

~~~spl syn=C
sinOsc(
	standardL(
		40,
		mouseX(0.9, 4, 0, 0.2),
		0.5,
		0
	) * 800 + 900,
	0
) * 0.1
~~~

* * *

See also: standardN

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/StandardL.html)

Categories: Chaos
