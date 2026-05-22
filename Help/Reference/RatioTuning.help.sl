# RatioTuning

- _RatioTuning(name='', description='', ratios, octave=2)_

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
>>> 	r.asCents.round,
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
>>> 	r.asCents.round,
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

In the unary case,
if the intervals are `Fraction` values they are understood to be ratios,
and the first ratio should be 1/1:

```
>>> RatioTuning[1/1 8/7 4/3 14/9 16/9]
>>> .asIntegers
[63 72 84 98 112]
```

If the intervals are `Integer` values they are understood to be integer pitches:

```
>>> RatioTuning[63 72 84 98 112]
>>> .asRatios
[1/1 8/7 4/3 14/9 16/9]
```

A five-limit tuning specified as a `List` of `Fraction`s:

```
>>> let t = RatioTuning[
>>> 	1/1 6/5 4/3 3/2 8/5
>>> ];
>>> (
>>> 	t.primeLimit,
>>> 	t.octave,
>>> 	t.asIntegers,
>>> 	t.asCents.round
>>> )
(
	5,
	2,
	[30 36 40 45 48],
	[0 316 498 702 814]
)
```

A seven-limit tuning specified as a `List` of integers:

```
>>> let t = RatioTuning[63 72 84 98 112];
>>> (
>>> 	t.primeLimit,
>>> 	t.octave,
>>> 	t.asRatios,
>>> 	t.asCents.round
>>> )
(
	7,
	2,
	[1 8/7 4/3 14/9 16/9],
	[0 231 498 765 996]
)
```

A seven-limit just intonation approximation of 13-tone equal temperament:

```
>>> let t = RatioTuning[
>>> 	1/1 135/128 9/8 7/6 5/4
>>> 	21/16 48/35 35/24 32/21 8/5
>>> 	27/16 9/5 243/128
>>> ];
>>> let k = (1200 / 13);
>>> let c = [0, k .. 1108];
>>> let j = t.asCents;
>>> (
>>> 	t.primeLimit,
>>> 	c.round,
>>> 	j.round,
>>> 	(j - c).round
>>> )
(
	7,
	[
		0 92 185 277 369 462 554 646
		738 831 923 1015 1108
	],
	[
		0 92 204 267 386 471 547 653
		729 814 906 1018 1110
	],
	[
		0 0 19 -10 17 9 -7
		7 -9 -17 -17 2 2
	]
)
```

An Erv Wilson scale (9 July 1967) specified as integers:

```
>>> let t = RatioTuning[
>>> 	600 625 672 700 750 800
>>> 	840 875 960 1000 1050 1120
>>> ];
>>> (t.primeLimit, t.asRatios)
(
	7,
	[
		1/1 25/24 28/25 7/6 5/4 4/3
		7/5 35/24 8/5 5/3 7/4 28/15
	]
)
```

_Rationale:_
The type caches the value of `primeLimit` since it is used to construct a large dictionary of tunings.

* * *

See also: CentsTuning, ScalaTuning, Tuning

Guides: Tuning Functions

Categories: Tuning, Type
