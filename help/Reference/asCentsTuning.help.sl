# asCentsTuning

- _asCentsTuning(aList)_

Answer a `CentsTuning` given a sequence of intervals in _cents_.

```
>>> let c = (0:11 * 100);
>>> let t = c.asCentsTuning;
>>> t.asRatios.collect(asFraction:/1)
[1/1 18/17 46/41 107/90 63/50 4/3 140/99 3/2 73/46 37/22 139/78 185/98]

>>> let r = [1/1 18/17 46/41 107/90 63/50 4/3 140/99 3/2 73/46 37/22 139/78 185/98];
>>> let t = r.asRatioTuning;
>>> t.asCents.rounded
[0 99 199 300 400 498 600 702 800 900 1000 1100]
```

* * *

See also: asRatioTuning, CentsTuning, RatioTuning, Tuning
