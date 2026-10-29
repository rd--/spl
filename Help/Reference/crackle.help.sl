# crackle

- _crackle(chaosParameter=1.5)_

Chaotic noise function.
A noise generator based on a chaotic function.

- chaosParameter: useful values are from just below 1 to just above 2, towards 2 the sound crackles.

Fixed chaos parameter:

~~~spl syn=A
crackle(1.95) * 0.1
~~~

Modulate chaos parameter:

~~~spl syn=B
crackle(
	line(1, 2, 10)
) * 0.1
~~~

Mouse control of chaos parameter:

~~~spl syn=C
crackle(
	[
		mouseX(1, 2, 0, 0.2),
		mouseY(1, 2, 0, 0.2)
	]
) * 0.1
~~~

* * *

See also: latoocarfianN, logistic

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Crackle.html)

Categories: Ugen, Noise
