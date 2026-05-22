# CentsTuning

- _CentsTuning(name='', description='', cents, octave=2)_

A `Type` for a `Tuning` where the non-_octave_ intervals are stored as _cents_ values.

`equalTemperamentTuning` answers a `CentsTuning`:

```
>>> 12.equalTemperamentTuning
CentsTuning(
	'ET-12',
	'Twelve tone equal-temperament',
	[
		  0  100  200  300   400  500
		600  700  800  900  1000 1100
	],
	2
)
```

The unary form requires only the list of _cents_ values:

```
>>> let c = [0 .. 11] * 100;
>>> let t = CentsTuning(c);
>>> t.asRatios.collect { :each |
>>> 	each.asFraction(1E-2)
>>> }
[
	1/1 16/15 9/8 13/11 5/4 4/3
	17/12 3/2 19/12 27/16 16/9 17/9
]
```

Translate the simplified ratios to cents courtesy `asCents`:

```
>>> RatioTuning[
>>> 	1/1 16/15 9/8 13/11 5/4 4/3
>>> 	17/12 3/2 19/12 27/16 16/9 17/9
>>> ].asCents.round
[
	0 112 204 289 386 498 603
	702 796 906 996 1101
]
```

* * *

See also: asCents, asCentsTuning, equalTemperamentTuning, RatioTuning, Tuning

Guides: Tuning Functions

Categories: Tuning
