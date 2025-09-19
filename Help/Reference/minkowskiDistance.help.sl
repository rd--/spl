# minkowskiDistance

- _minkowskiDistance(p, u, v)_
- _minkowskiDistance(p)_

The Minkowski distance is typically used with _p_ being 1 or 2,
which correspond to the `manhattanDistance` and the `euclideanDistance`, respectively.

Manhattan distance:

```
>>> minkowskiDistance(1, [0 0], [1 1])
2
```

Euclidean distance:

```
>>> minkowskiDistance(2, [0 0], [1 1])
2.sqrt
```

The unary form answers a two argument block:

```
>>> let f:/2 = minkowskiDistance(3.5);
>>> f([0 0], [1 1])
1.2190
```

* * *

See also: euclideanDistance, manhattanDistance

Guides: Distance Functions, Similarity Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Minkowski_distance)

Categories: Distance
