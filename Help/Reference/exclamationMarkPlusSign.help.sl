# !+ (exclamationMarkPlusSign)

- _x !+ y_

Duplicate and Sum.
Names the idiom of generating a list and then immediately summing it.
This operator does not need to construct the intermediate list structure to calculate the answer.

```
>>> { 5 } !+ 5
25

>>> let r = Sfc32(637142);
>>> { r.nextRandomFloat } !+ 100
46.7254
```

Sum randomly generated oscillators:

```
{ :tr |
	{
		let f = tChoose(
			tr,
			[48 .. 72]
		).midiCps;
		let ff = f * (
			sinOsc(
				tExpRand(4, 6, tr),
				0
			) * 0.008 + 1
		);
		lfSaw(
			ff * [
				tRand(0.99, 1.01, tr),
				tRand(0.99, 1.01, tr)
			],
			0
		) * 0.01
	} !+ 10
}.overlapTexture(2, 3, 4).mix
```

This name of this operator is `exclamationMarkPlusSign`.

* * *

See also: Sum, !, !^
