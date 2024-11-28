# asCentsTuning

- _asCentsTuning(aList)_

Answer a `CentsTuning` given a sequence of intervals in _cents_.

```
>>> let c = (0:11 * 100);
>>> let t = c.asCentsTuning;
>>> t.asRatios.collect { :each |
>>> 	each.asFraction(1E-2)
>>> }
[
	1/1 16/15 9/8 13/11 5/4 4/3
	17/12 3/2 19/12 27/16 16/9 17/9
]
```

Translate the simplified ratios to cents courtesy `asRatioTuning` and `asCents`:

```
>>> let r = [
>>> 	1/1 16/15 9/8 13/11 5/4 4/3
>>> 	17/12 3/2 19/12 27/16 16/9 17/9
>>> ];
>>> let t = r.asRatioTuning;
>>> t.asCents.rounded
[0 112 204 289 386 498 603 702 796 906 996 1101]
```

* * *

See also: asCents, asRatioTuning, CentsTuning, RatioTuning, Tuning

Categories: Converting
