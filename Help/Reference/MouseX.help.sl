# MouseX

- _MouseX(minval=0, maxval=1, warp=0, lag=0.2)_

Cursor unit generator.

- minval: value at left of screen
- maxval: value at right of screen
- warp: curve, 0=linear, 1=exponential
- lag: lag factor to smooth cursor movement

Mouse control of frequency:

```
SinOsc(MouseX(40, 10000, 1, 0.2), 0) * 0.1
```

Same as above but with a two second lag:

```
SinOsc(MouseX(40, 10000, 1, 2), 0) * 0.1
```

Two oscillators:

```
SinOsc(
	[
		MouseX(40, 10000, 1, 0.2),
		MouseY(40, 10000, 1, 0.2)
	],
	0
) * 0.1
```

_Note_:
MouseX and MouseY can report unexpected values on systems with multiple displays.

* * *

See also: MouseY, MouseButton

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/MouseX.html)

Categories: Ugen
