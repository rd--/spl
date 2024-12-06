# asRatioTuning

- _asRatioTuning(aList | aRecord)_

Answer a `RatioTuning` for `List` of interval values from a reference pitch,
which may be given as fractions or as integers,
or a `Record` of having _name_, _description_, _tuning_, _octave_ and _limit_ fields.

At `List` of `Fraction`s:

```
>>> let r = [1 6/5 4/3 3/2 8/5];
>>> let t = r.asRatioTuning;
>>> (
>>> 	t.asRatios,
>>> 	t.asCents.rounded,
>>> 	t.octave,
>>> 	t.isTuning,
>>> 	t.isRatioTuning,
>>> 	t.size,
>>> 	t.asIntegers
>>> )
(
	[1 6/5 4/3 3/2 8/5],
	[0 316 498 702 814],
	2/1,
	true,
	true,
	5,
	[30, 36, 40, 45, 48]
)
```

At `List` of integers:

```
>>> let i = [63 72 84 98 112];
>>> let t = i.asRatioTuning;
>>> let r = t.asRatios;
>>> let c = t.asCents.rounded;
>>> (t.limit, t.size, t.octave, r, c)
(
	7,
	5,
	2,
	[1 8/7 4/3 14/9 16/9],
	[0 231 498 765 996]
)
```

In the `List` case,
if the intervals are `Fraction` values they are understood to be ratios and the first ratio should be 1/1:

```
>>> [1/1 8/7 4/3 14/9 16/9]
>>> .asRatioTuning
>>> .asIntegers
[63 72 84 98 112]
```

A seven-limit just intonation approximation of 13-tone equal temperament:

```
>>> let r = [
>>> 	1/1 135/128 9/8 7/6 5/4
>>> 	21/16 48/35 35/24 32/21 8/5
>>> 	27/16 9/5 243/128
>>> ];
>>> let t = r.asRatioTuning;
>>> let k = (1200 / 13);
>>> let c = [0, k .. 1108];
>>> let j = t.asCents;
>>> (
>>> 	t.limit,
>>> 	c.rounded,
>>> 	j.rounded,
>>> 	(j - c).rounded
>>> )
(
	7,
	[
		0 92 185 277 369 462 554 646
		738 831	923 1015 1108
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

If the intervals are `Integer` values they are understood to be integer pitches:

```
>>> [63 72 84 98 112]
>>> .asRatioTuning
>>> .asRatios
[1/1 8/7 4/3 14/9 16/9]

>>> let t = [
>>> 	600 625 672 700 750 800
>>> 	840 875 960 1000 1050 1120
>>> ].asRatioTuning;
>>> (t.limit, t.asRatios)
(
	7,
	[
		1/1 25/24 28/25 7/6 5/4 4/3
		7/5 35/24 8/5 5/3 7/4 28/15
	]
)
```

* * *

See also: asCents, asIntegers, asRatios, CentsTuning, limit, RatioTuning, Tuning

Categories: Converting
