# asJiTuning

- _asJiTuning(aList | aRecord)_

Answer a `RatioTuning` given a `List` of interval values,
or a `Record` of having _name_, _description_, _tuning_, _octave_ and _limit_ fields.

In the `List` case,
if the intervals are `Fraction` values they are understood to be ratios and the first ratio should be 1/1:

```
>>> [1/1 8/7 4/3 14/9 16/9].asJiTuning.asIntegers
[63 72 84 98 112]
```

A seven-limit just intonation approximation of 13-tone equal temperament:

```
>>> let r = [1/1 135/128 9/8 7/6 5/4 21/16 48/35 35/24 32/21 8/5 27/16 9/5 243/128];
>>> let t = r.asJiTuning;
>>> let k = (1200 / 13);
>>> let c = [0, k .. 1108];
>>> let j = t.asCents;
>>> (t.limit, c.rounded, j.rounded, (j - c).rounded)
(
	7,
	[0 92 185 277 369 462 554 646 738 831 923 1015 1108],
	[0 92 204 267 386 471 547 653 729 814 906 1018 1110],
	[0  0  19 -10  17   9  -7   7  -9 -17 -17    2    2]
)
```

If the intervals are `Integer` values they are understood to be integer pitches:

```
>>> [63 72 84 98 112].asJiTuning.asRatios
[1/1 8/7 4/3 14/9 16/9]

>>> let t = [600 625 672 700 750 800 840 875 960 1000 1050 1120].asJiTuning;
>>> (t.limit, t.asRatios)
(7, [1/1 25/24 28/25 7/6 5/4 4/3 7/5 35/24 8/5 5/3 7/4 28/15])
```

* * *

See also: asCents, asIntegers, asRatios, JiTuning, limit, RatioTuning, Tuning

Categories: Converting
