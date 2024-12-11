# brayCurtisDistance

- _brayCurtisDistance(u, v)_

Answer the Bray-Curtis distance between vectors _u_ and _v_.
Equivalent to _(u - v).abs.sum / (u + v).abs.sum_

Bray–Curtis distance between two vectors:

```
>>> [1 2 3].brayCurtisDistance([2 4 6])
(1 / 3)
```

Bray–Curtis distance is a ratio of Manhattan distances:

```
>>> [1 3 5 7 9].brayCurtisDistance([1 2 3 4 5])
(1 / 4)

>>> let u = [1 3 5 7 9];
>>> let v = [1 2 3 4 5];
>>> let p = u.manhattanDistance(v);
>>> let q = u.manhattanDistance(v.-);
>>> p / q
(10 / 40)
```

* * *

See also: canberraDistance, chessboardDistance, euclideanDistance, editDistance, hammingDistance, manhattanDistance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BrayCurtisDistance.html)

Categories: Distance
