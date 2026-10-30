# dwhite

- _dwhite(length, lo, hi)_

Noise generator.

demand rate white noise random generator.
dwhite answers numbers in the continuous range between lo and hi.
The arguments can be a number or any other unit generator.

- length: number of values to create
- lo: minimum value
- hi: maximum value

Mouse controls range of frequency and rate of change.

~~~spl syn=A
let seq = dwhite(
	Infinity,
	0,
	mouseY(7, 45, 0, 0.2)
);
let trig = impulse(
	mouseX(1, 40, 1, 0.2),
	0
);
let freq = demand(
	trig,
	0,
	seq
) * 30 + 340;
sinOsc(freq, 0) * 0.1
~~~

* * *

See also: dbrown, diwhite, whiteNoise

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Dwhite.html)
