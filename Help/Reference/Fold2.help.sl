# Fold2

- _Fold2(a, b)_

Bilateral folding.
Folds _a_ to +/- _b_.

```
SinOsc(1000, 0).Fold2(Line(0, 1, 23)) / 3
```

Using `SinOsc`:

```
SinOsc(55, 0).Fold2(
	SinOsc(0.5, 0)
	.LinLin(-1, 1, 0.2, 4)
)
```

High frequencies:

```
let o = Fold2(
	SinOsc(
		[9333, 12111],
		[0, 5 / pi]
	),
	SinOsc(
		[0.51, 0.37],
		0
	).LinLin(-1, 1, 0, [0.1, 0.3])
);
let e = SinOsc(
	[7, 11] * SinOsc(
		[0.5, 0.33],
		0
	).LinLin(-1, 1, 1, [3, 4]),
	[0, 3 / pi]
);
o * e
```

* * *

See also: Clip2, Wrap2

Categories: Ugen, Math, Operator
