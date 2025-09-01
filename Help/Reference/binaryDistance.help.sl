# binaryDistance

- _binaryDistance(u, v)_

Answer the angular binary distance between vectors _u_ and _v_.

`binaryDistance` is equivalent to _(u != v).boole_.

Binary distance between numeric vectors:

```
>>> [1 2 3].binaryDistance([2 4 6])
1
```

Binary distance between numbers:

```
>>> 3.binaryDistance(3)
0

>>> 3.binaryDistance(5)
1
```

Binary distance between two identical vectors:

```
>>> let u = [1 2 3];
>>> u.binaryDistance(u)
0
```

Binary distance between numeric vectors of different length:

```
>>> [1 2 3].binaryDistance([1 2])
1
```

* * *

See also: =, boole

Guides: Distance Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BinaryDistance.html),

Categories: Distance
