# asRatioTuning

- _asRatioTuning(x)_

Answer a `RatioTuning` for either a `List` of interval values from a reference pitch,
or a `ScalaTuning`.

In the `List` case,
if the intervals are `Fraction` values they are understood to be ratios.
The first ratio should be 1/1:

```
>>> [1/1 8/7 4/3 14/9 16/9]
>>> .asRatioTuning
>>> .asIntegers
[63 72 84 98 112]
```

If the intervals are `Integer` values they are understood to be integer pitches:

```
>>> [63 72 84 98 112]
>>> .asRatioTuning
>>> .asRatios
[1/1 8/7 4/3 14/9 16/9]
```

A five-limit tuning specified as a `List` of `Fraction`s:

```
>>> let r = [1/1 6/5 4/3 3/2 8/5];
>>> let t = r.asRatioTuning;
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
>>> let i = [63 72 84 98 112];
>>> let t = i.asRatioTuning;
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
>>> let t = [
>>> 	600 625 672 700 750 800
>>> 	840 875 960 1000 1050 1120
>>> ].asRatioTuning;
>>> (t.primeLimit, t.asRatios)
(
	7,
	[
		1/1 25/24 28/25 7/6 5/4 4/3
		7/5 35/24 8/5 5/3 7/4 28/15
	]
)
```

At `ScalaTuning`:

```
>>> ScalaTuning(
>>> 	name: 'alves_pelog',
>>> 	description: 'Pelog, 1/1 Vol.9 No.4',
>>> 	octave: [2 1],
>>> 	pitches: [8 7; 6 5; 21 16; 3 2; 8 5; 7 4],
>>> 	limit: 7
>>> ).asRatioTuning
RatioTuning(
	'alves_pelog',
	'Pelog, 1/1 Vol.9 No.4',
	[1 8/7 6/5 21/16 3/2 8/5 7/4],
	2/1
)
```

* * *

See also: asCents, asIntegers, asRatios, CentsTuning, limit, RatioTuning, ScalaTuning, Tuning

Categories: Converting
