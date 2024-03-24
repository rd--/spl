# asFractions

- _asFractions(aTuning)_

Answer a `List` of the interval ratios of _aTuning_.

At `RatioTuning` is equal to `asRatios`.

At `CentsTuning`, will answer a list of approximate `Fraction` values derived from the `SmallFloat` values answered by `asRatios`:

```
>>> 12.equalTemperamentTuning.asFractions(1E-2)
[1/1 16/15 9/8 13/11 5/4 4/3 17/12 3/2 19/12 27/16 16/9 17/9]
```

* * *

See also: asCents, asIntegers, asRatios, centsToRatio, RatioTuning, Tuning
