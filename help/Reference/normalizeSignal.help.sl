# normalizeSignal

- _normalizeSignal(aCollection, minima, maxima)_

Answers _aCollection_ rescaled to the indicated range,
taking as the domain ± of the `max` of the absolute values of the `min` and `max`:

```
>>> [-0.2 -0.1 0.4 0.9].normalizeSignal(-1, 1)
[-2/9 -1/9 4/9 1]
```

Unlike `normalize` this does not necessarily answer a signal which has the indicated _minima_ and _maxima_:

```
>>> [-0.2 -0.1 0.4 0.9].normalize(-1, 1)
[-1 -9/11 1/11 1]
```

* * *

See also: normalize, rescale

Categories: Math
