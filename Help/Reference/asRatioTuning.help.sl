# asRatioTuning

- _asRatioTuning(aList)_

Answer a `RatioTuning` for _aList_, which describes the tuning as a set of ratios from a reference pitch.

```
>>> let t = [1 6/5 4/3 3/2 8/5].asRatioTuning;
>>> (t.asRatios, t.asCents.rounded, t.octave)
([1 6/5 4/3 3/2 8/5], [0 316 498 702 814], 2)

>>> let t = [1 6/5 4/3 3/2 8/5].asRatioTuning;
>>> (t.isTuning, t.isRatioTuning, t.size, t.asIntegers)
(true, true, 5, [30 36 40 45 48])
```

* * *

See also: asJiTuning, CentsTuning, JiTuning, RatioTuning, Tuning

Categories: Converting
