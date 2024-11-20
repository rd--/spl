# normalizeRange

- _normalizeRange(aCollection, minima, maxima)_

Answers _aCollection_ rescaled to the indicated range,
taking as the domain the `min` and `max` items of the collection:

```
>>> [-0.2 -0.1 0.4 0.9].normalizeRange(-1, 1)
[-1 -9/11 1/11 1]

>>> [-0.2 -0.1 0.4 0.9].rescale(-0.2, 0.9, -1, 1)
[-1 -9/11 1/11 1]
```

In this form the `min` and `max` of the answer are _minima_ and _maxima_ respectively.

Note that this is not the same as the `normalizeSignal` function,
which maintains scaling about zero by taking the domain as ± of the `max` of the absolute values of the `min` and `max`:

```
>>> [-0.2 -0.1 0.4 0.9].normalizeSignal(-1, 1)
[-2/9 -1/9 4/9 1]
```

* * *

See also: normalize, normalizeSignal, rescale

Categories: Math
