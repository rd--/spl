# equalTemperamentTuning

- _equalTemperamentTuning(anInteger)_

Answer a `CentsTuning` holding an equal tempered tuning of _anInteger_ places.

Twelve tone equal temperament:

```
>>> let t = 12.equalTemperamentTuning;
>>> (
>>> 	t.isTuning,
>>> 	t.isCentsTuning,
>>> 	t.name,
>>> 	t.description,
>>> 	t.octave,
>>> 	t.asCents,
>>> 	t.asRatios.collect { :each |
>>> 		each.asFraction(1E-2)
>>> 	}
>>> )
(
	true,
	true,
	'ET-12',
	'Twelve tone equal-temperament',
	2,
	0:11 * 100,
	[
		1/1 16/15 9/8 13/11
		5/4 4/3 17/12 3/2
		19/12 27/16 16/9 17/9
	]
)
```

Seven tone equal temperament:

```
>>> let t = 7.equalTemperamentTuning;
>>> (
>>> 	t.asCents.rounded,
>>> 	t.asRatios.collect { :each |
>>> 		each.asFraction(1E-2)
>>> 	}
>>> )
(
	[
		0 171 343 514
		686 857 1029
	],
	[
		1/1 10/9 11/9 23/17
		31/21 18/11 20/11
	]
)
```

* * *

See also: asCents, asRatios, CentsTuning, description, isCentsTuning, isTuning, name, Tuning

Guides: Tuning Functions
