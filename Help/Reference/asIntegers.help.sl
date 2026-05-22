# asIntegers

- _asIntegers(t)_

Of a rational tuning _t_,
answer the intervals specified as integers.

```
>>> RatioTuning[
>>> 	1/1 8/7 4/3 14/9 16/9
>>> ].asIntegers
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
