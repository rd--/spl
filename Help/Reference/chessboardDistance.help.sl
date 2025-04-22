# chessboardDistance

- _chessboardDistance(u, v)_

Answer the chessboard, Chebyshev, or sup norm distance between vectors _u_ and _v_.

Equivalent to _(u - v).abs.max_.

Chessboard distance between numeric vectors:

```
>>> [1 2 3].chessboardDistance([2 4 6])
3

>>> [1 5 2 3 10].chessboardDistance(
>>> 	[4 15 20 5 5]
>>> )
18
```

* * *

See also: brayCurtisDistance, canberraDistance, euclideanDistance, editDistance, hammingDistance, manhattanDistance

Guides: Distance Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ChessboardDistance.html)

Categories: Distance
