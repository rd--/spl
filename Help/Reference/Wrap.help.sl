# Wrap

- _Wrap(in, lo=0, hi=1)_

Wrap a signal outside given thresholds.
This differs from _Wrap2_ in that it allows one to set both low and high thresholds.

- in: signal to be wrapped
- lo: low threshold of wrapping
- hi: high threshold of wrapping

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

Categories: Ugen
