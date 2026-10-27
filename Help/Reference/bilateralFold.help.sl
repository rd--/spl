# bilateralFold

- _bilateralFold(a, b)_

Bilateral folding.
Folds _a_ to +/- _b_.

```
SinOsc(1000, 0)
.bilateralFold(Line(0, 1, 23)) / 3
```

Using `SinOsc`:

```
SinOsc(55, 0).bilateralFold(
	SinOsc(0.5, 0)
	.linLin(-1, 1, 0.2, 4)
)
```

High frequencies:

```
let o = SinOsc(
	[9333, 12111],
	[0, 5 / 1.pi]
).bilateralFold(
	SinOsc(
		[0.51, 0.37],
		0
	).linLin(-1, 1, 0, [0.1, 0.3])
);
let e = SinOsc(
	[7, 11] * SinOsc(
		[0.5, 0.33],
		0
	).linLin(-1, 1, 1, [3, 4]),
	[0, 3 / 1.pi]
);
o * e
```

* * *

See also: bilateralClip, bilateralWrap

Guides: Unit Generators

Categories: Ugen, Math, Operator
