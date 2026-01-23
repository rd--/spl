# tuningIndices

- _tuningIndices(s)_

A `Scale` is a sub-set of the indices of a `Tuning`,
and this method answer the indices specified by the scale _s_.

```
>>> 'Major'.namedScale.tuningIndices
[1 3 5 6 8 10 12]
```

The `differences` of the `tuningIndices` are the `intervals` of the scale,
without the interval from the last to the first degree:

```
>>> [1 3 5 6 8 10 12].differences
[2 2 1 2 2 2]

>>> 'Major'.namedScale.intervals
[2 2 1 2 2 2 1]
```

In cases where the `startIndex` of the scale is not `one`,
the `tuningIndices` will likewise be offset:

```
>>> 'Tembung'.namedScale.tuningIndices
[4 5 6 1 2]
```

* * *

See also: intervals, Scale

Guides: Scale Functions
