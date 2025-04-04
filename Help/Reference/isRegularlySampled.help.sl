# isRegularlySampled

- _isRegularlySampled(x)_

Answers `true` if _x_ is a regular time series, and `false` otherwise.

A vector is always regular:

```
>>> [1 -1 3 -3 5 -5].isRegularlySampled
true
```

Test the regularity of time-value pairs:

```
>>> [1 0; 2 0; 3 0].isRegularlySampled
true

>>> [1 0; 2.5 0; 3 0].isRegularlySampled
false
```

Test an ensemble of paths for regularity:

```
>>> let r = Sfc32(567132);
>>> PoissonProcess(5)
>>> .randomFunction(r, [1 10], 100)
>>> .isRegularlySampled
false

>>> let r = Sfc32(789123);
>>> BernoulliProcess(5)
>>> .randomFunction(r, [1 10], 100)
>>> .isRegularlySampled
true
```

* * *

See also: isRegularlySpaced, minimumTimeIncrement, TemporalData, TimeSeries

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RegularlySampledQ.html)
