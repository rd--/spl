# normalizeRange

- _normalizeRange([x₁ x₂ …], [⌊ ⌈])_

Answers the collection _x_ rescaled to the indicated range,
taking as the domain the `min` and `max` items of the collection:

```
>>> [-2/10 -1/10 4/10 9/10]
>>> .normalizeRange([-1/1 1/1])
[-1/1 -9/11 1/11 1/1]

>>> [-0.2 -0.1 0.4 0.9]
>>> .normalizeRange([-1.0 1.0])
[-1.0 -0.818181 0.090909 1.0]
```

Compare to `rescale`:

```
>>> [-2/10 -1/10 4/10 9/10]
>>> .rescale([-2/10 9/10], [-1/1 1/1])
[-1/1 -9/11 1/11 1/1]

>>> [-0.2 -0.1 0.4 0.9]
>>> .rescale([-0.2 0.9], [-1 1])
[-1.0 -0.818181 0.090909 1.0]
```

If the input has only one distinct value answer itself,
or constant minima or maxima:

```
>>> [1 1 1 1].normalizeRange([0 1])
[1 1 1 1]

>>> [-1 -1 -1 -1].normalizeRange([0 1])
[0 0 0 0]

>>> [2 2 2 2].normalizeRange([0 1])
[1 1 1 1]
```

In this form the `min` and `max` of the answer are the specified minima and maxima respectively.

Note that this is not the same as the `normalizeSignal` function,
which maintains scaling about zero by taking the domain as ± of the `max` of the absolute values of the `min` and `max`:

```
>>> [-0.2 -0.1 0.4 0.9]
>>> .normalizeSignal([-1 1])
[-2/9 -1/9 4/9 1]
```

* * *

See also: normalize, normalizeSignal, rescale

Guides: Signal Processing Functions

Categories: Math
