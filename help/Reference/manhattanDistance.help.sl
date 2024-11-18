# manhattanDistance

- _manhattanDistance(u, v)_

Answers the Manhattan or _city block_ distance between two vectors _u_ and _v_.

```
>>> [1 2 3].manhattanDistance([2 4 6])
6

>>> [1 5 2 3 10].manhattanDistance([4 15 20 5 5])
38
```

The Manhattan distance is equivalent to _(u - v).abs.sum_.

```
>>> ([1 2 3] - [2 4 6]).abs.sum
6

>>> ([1 5 2 3 10] - [4 15 20 5 5]).abs.sum
38
```

* * *

See also: editDistance, euclideanDistance, hammingDistance

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TaxicabMetric.html)
[2](https://reference.wolfram.com/language/ref/ManhattanDistance.html),
_W_
[1](https://en.wikipedia.org/wiki/Taxicab_geometry)

Categories: Geometry
