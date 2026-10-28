# linXFade2

- _linXFade2(a, b, pos=0)_

Two channel linear cross-fade.

- a: an input signal
- b: another input signal
- pos: cross fade position from -1 to +1

Cross fade from sine tone to noise and back again:

```
linXFade2(
	sinOsc(800, 0),
	pinkNoise(),
	sinOsc(1, 0)
) * 0.1
```

* * *

See also: xFade2

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LinXFade2.html)

Categories: Ugen
