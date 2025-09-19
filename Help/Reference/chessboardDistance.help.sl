# chessboardDistance

- _chessboardDistance(u, v)_

Answer the chessboard distance,
also called the Chebyshev distance,
between the two vectors _u_ and _v_.

Chessboard distance between numeric three-vectors:

```
>>> [1 2 3].chessboardDistance([2 4 6])
3
```

Equivalent to _⌈|u-v|_:

```
>>> ([1 2 3] - [2 4 6]).abs.max
3
```

At five vectors:

```
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
[1](https://reference.wolfram.com/language/ref/ChessboardDistance.html),
_W_
[1](https://en.wikipedia.org/wiki/Chebyshev_distance)

Categories: Distance
