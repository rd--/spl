# mouseX

- _mouseX(minval=0, maxval=1, warp=0, lag=0.2)_

Cursor unit generator.

- minval: value at left of screen
- maxval: value at right of screen
- warp: curve, 0=linear, 1=exponential
- lag: lag factor to smooth cursor movement

Mouse control of frequency:

~~~spl syn=A
sinOsc(mouseX(40, 10000, 1, 0.2), 0) * 0.1
~~~

Same as above but with a two second lag:

~~~spl syn=B
sinOsc(mouseX(40, 10000, 1, 2), 0) * 0.1
~~~

Two oscillators:

~~~spl syn=C
sinOsc(
	[
		mouseX(40, 10000, 1, 0.2),
		mouseY(40, 10000, 1, 0.2)
	],
	0
) * 0.1
~~~

_Note_:
mouseX and mouseY can report unexpected values on systems with multiple displays.

* * *

See also: mouseButton, mouseY

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/MouseX.html)

Categories: Ugen
