# euclideanDistance

- _euclideanDistance(u, v)_

Answer the Euclidean distance between vectors _u_ and _v_.

Equivalent to _(u - v).norm_.

Euclidean distance between two-vectors:

```
>>> [0 0].euclideanDistance([1/2 1/2])
1/2.sqrt
```

Euclidean distance between three-vectors:

```
>>> [1 2 3].euclideanDistance([2 4 6])
14.sqrt

>>> [2 4 6].euclideanDistance([1 2 3])
14.sqrt

>>> ([1 2 3] - [2 4 6]).norm
14.sqrt

>>> [1 2 3].euclideanDistance([4 5 6])
5.196

>>> [0 0 0].euclideanDistance([1/2 1/2 1/2])
1/3.pi.sin
```

Euclidean distance between five-vectors:

```
>>> [1 5 2 3 10].euclideanDistance(
>>> 	[4 15 20 5 5]
>>> )
462.sqrt
```

The Euclidean distance in one dimension is the absolute value of the difference:

```
>>> 3.euclideanDistance(1)
(1 - 3).abs
```

The Euclidean distance in two dimensions is the straight line distance:

```
>>> [0 0].euclideanDistance([1 1])
2.sqrt

>>> [1 1].euclideanDistance([0 0])
2.sqrt

>>> [0 1].euclideanDistance([1 0])
2.sqrt
```

* * *

See also: -, abs, brayCurtisDistance, canberraDistance, chessboardDistance, editDistance, hammingDistance, manhattanDistance, norm

Guides: Distance Functions, Similarity Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Distance.html)
[2](https://reference.wolfram.com/language/ref/EuclideanDistance.html),
_W_
[1](https://en.wikipedia.org/wiki/Euclidean_distance)

Categories: Distance, Geometry
