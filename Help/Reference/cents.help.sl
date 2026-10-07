# cents

- _cents(t)_

Answer a `List` of the intervals of the tuning _t_ in _cents_.

At `RatioTuning`:

```
>>> RatioTuning[1/1 8/7 4/3 14/9 16/9]
>>> .cents
[0 231.17 498.05 764.92 996.09]
```

This is `ratioToCents` of `ratios`:

```
>>> [1/1 8/7 4/3 14/9 16/9].ratioToCents
[0 231.17 498.05 764.92 996.09]
```

At `CentsTuning`:

```
>>> 12.equalTemperamentTuning.cents
[0 .. 11] * 100
```

* * *

See also: CentsTuning, RatioTuning, ScalaTuning, Tuning, integers, ratios, ratioToCents

Guides: Tuning Functions

Categories: Converting
