# hasher

- _hasher(in)_

Randomized value.

Returns a unique output value from zero to one for each input value according to a hash function.
The same input value will always produce the same output value.
The input need not be from zero to one.

- in: input signal

Hashing a straight line makes white noise:

~~~spl syn=A
hasher(line(0, 1, 1)) * 0.2
~~~

Control rate hash of rounded mouse control, near values hash distinctly:

~~~spl syn=B
let x = mouseX(0, 10, 0, 0.2);
sinOsc(
	hasher(
		x.round([0.2, 1]) + [0, 0.0001]
	) * 300 + 500,
	0
) * 0.1
~~~

* * *

See also: whiteNoise

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Hasher.html)

Categories: Ugen
