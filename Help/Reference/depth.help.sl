# depth

- _depth(aCollection | anObject)_

Answer the maximum number of indices needed to specify any part of _aCollection_.
Objects that are not collections have _depth_ of one.

A `String` has depth one:

```
>>> 'x'.depth
1
```

A _vector_ has depth two:

```
>>> [1 2 3].depth
2
```

A _matrix_, regular and irregular, has depth three:

```
>>> [1 2; 3 4; 5 6].depth
3

>>> [1 2; 3 4 5].depth
3
```

Only the deepest part of the expression affects the depth:

```
>>> [[[1]]].depth
4

>>> [[[1], 2]].depth
4
```

At deeply nested `List`:

```
>>> [1, [3, [5, [7, [9]]]]].depth
6

>>> [[[[[1], 3], 5], 7], 9].depth
6
```

At deeply nested `Tuple`:

```
>>> (1, (3, (5, (7, 9)))).depth
5
```

At `Tree`:

```
>>> [1, [2, [3], 4], 5]
>>> .expressionTree(nil)
>>> .depth
4
```

A `Number` has depth one:

```
>>> 12345.depth
1

>>> 3J1.depth
1

>>> 2/3.depth
1

>>> 2.sqrt.depth
1
```

The depth of values is considered when computing the depth of a `Record`:

```
>>> (x: 1, y: 2, z: 3).depth
2

>>> (x: 1, y: [2 3], z: [4 5; 6 7]).depth
4
```

Depth of a nested `Record`:

```
>>> (x: (y: (z: 3))).depth
4
```

`depth` returns a depth one greater than that returned by `rank`:

```
>>> let v = [1 2 3];
>>> (v.depth, v.rank)
(2, 1)
```

* * *

See also: leafCount, rank

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Depth.html)
