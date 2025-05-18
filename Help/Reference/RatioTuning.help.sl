# RatioTuning

- _RatioTuning(name, description, ratios, octave)_

A `Type` holding a `Tuning` where the intervals are represented as _ratios_.
The ratios are stored internally as `Fraction` values,
however they may be specified as either fractions or as integers.

Tuning specified using fractions:

```
>>> let r = RatioTuning(
>>> 	'Bill Alves, Slendro',
>>> 	'Slendro for Gender Barung',
>>> 	[1/1 8/7 4/3 14/9 16/9],
>>> 	2
>>> );
>>> (
>>> 	r.size,
>>> 	r.primeLimit,
>>> 	r.asCents.rounded,
>>> 	r.asIntegers
>>> )
(
	5,
	7,
	[0 231 498 765 996],
	[63 72 84 98 112]
)
```

Tuning specified as integers:

```
>>> let r = RatioTuning(
>>> 	'Erv Wilson, Class',
>>> 	'9 July 1967',
>>> 	[
>>> 		600 625 672 700 750 800
>>> 		840 875 960 1000 1050 1120
>>> 	],
>>> 	2
>>> );
>>> (
>>> 	r.size,
>>> 	r.primeLimit,
>>> 	r.asCents.rounded,
>>> 	r.asRatios
>>> )
(
	12,
	7,
	[
		0 71 196 267 386 498
		583 653 814 884 969 1081
	],
	[
		1/1 25/24 28/25 7/6 5/4 4/3
		7/5 35/24 8/5 5/3 7/4 28/15
	]
)
```

_Rationale:_
The type caches the value of `primeLimit` since it is used to construct a large dictionary of tunings.

* * *

See also: asRatioTuning, CentsTuning, ScalaTuning, Tuning

Categories: Tuning, Type
