# canberraDistance

- _canberraDistance(u, v)_

Answer the Canberra distance between vectors _u_ and _v_.

Equivalent to _((u - v).abs / (u.abs + v.abs)).sum_.

```
>>> [1 2 3].canberraDistance([2 4 6])
1

>>> let u = [1 2 3];
>>> let v = [2 4 6];
>>> ((u - v).abs / (u.abs + v.abs)).sum
1

>>> [1 5 2 3 10].canberraDistance(
>>> 	[4 15 20 5 5]
>>> )
2.50151
```

* * *

See also: brayCurtisDistance, chessboardDistance, euclideanDistance, editDistance, hammingDistance, manhattanDistance

Guides: Distance Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CanberraDistance.html),
_W_
[1](https://en.wikipedia.org/wiki/Canberra_distance)

Further Reading: Lance 1966

Categories: Distance
