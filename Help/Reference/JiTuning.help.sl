# JiTuning

- _JiTuning(name, description, ratiosOrIntegers, octave, limit)_

Answers a `RatioTuning` representing a just-intonation (Ji) tuning.

```
>>> let i = [63 72 84 98 112];
>>> let t = i.asJiTuning;
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

* * *

See also: asCents, asIntegers, asJiTuning, asRatios, CentsTuning, RatioTuning, Tuning

Categories: Tuning
