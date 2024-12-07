# asIntegers

- _asIntegers(aTuning)_

Of a rational tuning,
answer the intervals specified as integers.

```
>>> [1/1 8/7 4/3 14/9 16/9]
>>> .asRatioTuning
>>> .asIntegers
[63 72 84 98 112]
```

The answer is `asRatios` divided by their greatest common divisor:

```
>>> [1/1 8/7 4/3 14/9 16/9].gcd
1/63

>>> [1/1 8/7 4/3 14/9 16/9] * 63
[63 72 84 98 112]
```

* * *

See also: asCents, asFractions, asRatios, RatioTuning, Tuning

Categories: Converting
