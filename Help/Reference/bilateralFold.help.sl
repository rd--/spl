# bilateralFold

- _bilateralFold(a, b)_

Bilateral folding.
Folds _a_ to +/- _b_.

~~~spl syn=A
sinOsc(1000, 0)
.bilateralFold(line(0, 1, 23)) / 3
~~~

Using `sinOsc`:

~~~spl syn=B
sinOsc(55, 0).bilateralFold(
	sinOsc(0.5, 0)
	.linLin(-1, 1, 0.2, 4)
)
~~~

High frequencies:

~~~spl syn=C
let o = sinOsc(
	[9333, 12111],
	[0, 5 / 1.pi]
).bilateralFold(
	sinOsc(
		[0.51, 0.37],
		0
	).linLin(-1, 1, 0, [0.1, 0.3])
);
let e = sinOsc(
	[7, 11] * sinOsc(
		[0.5, 0.33],
		0
	).linLin(-1, 1, 1, [3, 4]),
	[0, 3 / 1.pi]
);
o * e
~~~

* * *

See also: bilateralClip, bilateralWrap

Guides: Unit Generators

Categories: Ugen, Math, Operator
