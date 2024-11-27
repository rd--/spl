# RatioTuning

- _RatioTuning(name, description, ratios, octave)_

A `Type` holding a `Tuning` where the intervals are represented as _ratios_ stored as `Fraction` values.

```
>>> let r = RatioTuning(
>>> 	'',
>>> 	'',
>>> 	[1/1 8/7 4/3 14/9 16/9],
>>> 	2
>>> );
>>> (r.size, r.limit, r.asCents.rounded, r.asIntegers)
(
	5,
	7,
	[0 231 498 765 996],
	[63 72 84 98 112]
)
```

_Rationale:_
The type caches the value of _limit_ since it is used to construct a large dictionary of tunings.

* * *

See also: asRatioTuning, CentsTuning, IntegerTuning, JiTuning, Tuning

Categories: Tuning, Type
