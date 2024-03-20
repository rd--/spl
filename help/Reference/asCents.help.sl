# asCents

- _asCents(aTuning)_

Answer a `List` of the intervals of _aTuning_ in _cents_.

At `RatioTuning`:

```
>>> let ratios = [1/1 8/7 4/3 14/9 16/9];
>>> ratios.asRatioTuning.asCents
[0 231.17 498.05 764.92 996.09]

>>> [1/1 8/7 4/3 14/9 16/9].ratioToCents
[0 231.17 498.05 764.92 996.09]
```

At `CentsTuning`:

```
>>> 12.equalTemperamentTuning.asCents
0:11 * 100
```

* * *

See also: asIntegers, asRatios, equalTemperamentTuning, ratioToCents, RatioTuning, Tuning
