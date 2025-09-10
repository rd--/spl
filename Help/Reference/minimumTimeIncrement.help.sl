# minimumTimeIncrement

- _minimumTimeIncrement(t)_

The minimum time increment for a vector is always `one`:

```
>>> [1 3 5 7 9].minimumTimeIncrement
1
```

Find the minimum time increment for a list of time-value pairs:

```
>>> [1 0; 2 0; 2.5 0; 4 0]
>>> .minimumTimeIncrement
0.5
```

Find the minimum time increments for a time series:

```
>>> TimeSeries([1 0; 2 0; 2.5 0; 4 0])
>>> .minimumTimeIncrement
0.5
```

Find the minimum time increments for a collection of paths:

```
>>> let r = Sfc32(567132);
>>> PoissonProcess(3)
>>> .randomFunction(r, [1 100], 2)
>>> .minimumTimeIncrement
[0.0022893 0.0011605]
```

* * *

See also: isRegularlySampled, TemporalData, TimeSeries

Guides: Time Series Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MinimumTimeIncrement.html)
