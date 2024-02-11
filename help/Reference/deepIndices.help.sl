# deepIndices

_deepIndices(aCollection)_

Answer a List of indices, each a List, of the paths to each leaf element in _aCollection_.

A leaf element is an item that is not of the same type as _aCollection_.

At List:

```
>>> [1; 2 3; 4 5 6].deepIndices
[1 1; 2 1; 2 2; 3 1; 3 2; 3 3]

>>> [1 [2 [3]]].deepIndices
[1; 2 1; 2 2 1]
```

At Tuple:

```
>>> (1, (2, 3), (4, 5, 6)).deepIndices
[1 1; 2 1; 2 2; 3 1; 3 2; 3 3]

>>> (1, (2, (3, 4))).deepIndices
[1; 2 1; 2 2 1; 2 2 2]
```

At Record:

```
>>> (x: 1, y: (x: 2, y:3), z: (x: 4, y: 5, z: 6)).deepIndices
['x'; 'y' 'x'; 'y' 'y'; 'z' 'x'; 'z' 'y'; 'z' 'z']
```

_atPath_ and @>:

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

* * *

See also: deepCollect, deepDo, indices, shapeIndices

Categories: Accessing, Indexing
