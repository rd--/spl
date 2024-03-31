# euclideanDistance

- _euclideanDistance(u, v)_

Answer the Euclidean distance between vectors _u_ and _v_.

Equivalent to _(u - v).norm_.

Euclidean distance between numeric vectors:

```
[1 2 3].euclideanDistance([2 4 6])
14.sqrt

>>> [1 5 2 3 10].euclideanDistance([4 15 20 5 5])
21.49419
```

The Euclidean distance in one dimension is the absolute value of the difference:

```
>>> 3.euclideanDistance(1)
(1 - 3).abs
```

* * *

See also: brayCurtisDistance, canberraDistance, chessboardDistance, editDistance, hammingDistance, manhattanDistance

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Distance.html)
[2](https://reference.wolfram.com/language/ref/EuclideanDistance.html),
_W_
[1](https://en.wikipedia.org/wiki/Euclidean_distance)
