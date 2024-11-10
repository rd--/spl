# asRatios

- _asRatios(aTuning)_

Answer a `List` of the interval ratios of _aTuning_.

At `RatioTuning`, will answer a list of `Fraction` values:

```
>>> let ratios = [1/1 8/7 4/3 14/9 16/9];
>>> let tuning = ratios.asRatioTuning;
>>> (tuning.asRatios, tuning.asCents)
(ratios, [0 231.17 498.05 764.92 996.09])

>>> [0 231.17 498.05 764.92 996.09].centsToRatio.collect(asFraction:/1)
[1/1 8/7 4/3 14/9 16/9]
```

At `CentsTuning`, will answer a list of `SmallFloat` values (c.f. `asFractions`):

```
>>> 12.equalTemperamentTuning.asRatios
[1 1.0595 1.1225 1.1892 1.2599 1.3348 1.4142 1.4983 1.5874 1.6818 1.7818 1.8878]
```

* * *

See also: asCents, asFractions, asIntegers, centsToRatio, RatioTuning, Tuning
