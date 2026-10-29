# fos

- _fos(in, a0, a1, b1)_

First order filter section.
Alias for `firstOrderFilterSection`.

A standard first order filter section.
Filter coefficients are given directly rather than calculated for you.
Formula is equivalent to _y(i)=a0·x(i)+a1·x(i-1)+b1·y(i-1)_.

Same as `onePole`:

~~~spl syn=A
let x = mouseX(-1, 1, 0, 0.2);
firstOrderFilterSection(
	lfSaw(200, 0) * 0.1,
	1 - x.abs,
	0,
	x
)
~~~

Same as `oneZero`:

~~~spl syn=B
let x = mouseX(-1, 1, 0, 0.2);
firstOrderFilterSection(
	lfSaw(200, 0) * 0.1,
	1 - x.abs,
	x,
	0
)
~~~

* * *

See also: sos

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/FOS.html)

Categories: Ugen
