# deepIndices

- _deepIndices(aCollection, aBlock:/1)_
- _deepIndices(alpha)_ ⟹ _deepIndices(alpha, true.constant)_

Answer a `List` of indices, each a `List`, of the paths to each leaf element in _aCollection_
that satisfies the predicate _aBlock_.

A leaf element is an item that is not of the same type as _aCollection_.

At `Range`:

```
>>> 1:9.deepIndices
[1; 2; 3; 4; 5; 6; 7; 8; 9]

>>> 1:9.deepIndices { :each | each >= 7 }
[7; 8; 9]
```

At `List`:

```
>>> [1; 2 3; 4 5 6].deepIndices
[1 1; 2 1; 2 2; 3 1; 3 2; 3 3]

>>> [1, [2, [3]]].deepIndices
[1; 2 1; 2 2 1]

>>> [1, [2, [3]]].deepIndices(isEven:/1)
[[2, 1]]
```

At `Tuple`:

```
>>> (1, (2, 3), (4, 5, 6)).deepIndices
[1; 2 1; 2 2; 3 1; 3 2; 3 3]

>>> (1, (2, (3, 4))).deepIndices
[1; 2 1; 2 2 1; 2 2 2]
```

At `Record`:

```
>>> (x: 1, y: (x: 2, y:3), z: (x: 4, y: 5, z: 6)).deepIndices
['x'; 'y' 'x'; 'y' 'y'; 'z' 'x'; 'z' 'y'; 'z' 'z']

>>> (x: 1, y: (x: 2, y:3), z: (x: 4, y: 5, z: 6)).deepIndices(isEven:/1)
['y' 'x'; 'z' 'x'; 'z' 'z']
```

`atPath` and @>:

```
>>> let l = [1; 2 3; 4 5 6];
>>> let i = l.deepIndices;
>>> [l] @>.map i
[1 2 3 4 5 6]

>>> let r = (x: 1, y: (x: 2, y:3), z: (x: 4, y: 5, z: 6));
>>> let i = r.deepIndices;
>>> [r] @>.map i
[1 2 3 4 5 6]
```

Find the positions at which zero occurs:

```
>>> [1 1 0; 0 1 1; 1 0 1].deepIndices(isZero:/1)
[1 3; 2 1; 3 2]
```

Find positions with prime values:

```
>>> (x: 3, y: (x: 4, y: (x: 5))).deepIndices(isPrime:/1)
['x'; 'y' 'y' 'x']
```

* * *

See also: deepCollect, deepDo, indices, shapeIndices

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Position.html)

Categories: Accessing, Indexing
