# Wrap

- _Wrap(x, ⌊=0, ⌈=1)_

Wrap a signal outside given thresholds.
This differs from _Wrap2_ in that it allows one to set both low and high thresholds.

- x: signal to be wrapped
- ⌊: low threshold of wrapping
- ⌈: high threshold of wrapping

Wrap a (-0.2, 0.2) sine tone to (-0.15, 0.15):

```
Wrap(
	SinOsc(440, 0) * 0.2,
	-0.15,
	0.15
)
```

Wrap frequency input:

```
let z = SinOsc(
	1 / 11,
	0
).LinLin(-1, 1, 100, 200);
SinOsc(
	Wrap(
		z,
		[110, 130],
		[190, 170]
	),
	0
) * 0.1
```

* * *

See also: Clip, Fold, Wrap2

Guides: Unit Generators

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_common_wrap/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Wrap.html)

Categories: Ugen
