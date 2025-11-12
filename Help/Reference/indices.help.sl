# indices

- _indices(c)_
- _indices(c, f:/1)_

Answer the valid indices for the collection _c_.
The binary form only answers indices where the associated item satisifes the predicate block _f_.

At a `Sequence`,
`indices` answers a `Range` from the first to the last index by `one`.
At a `Dictionary`,
`indices` answers a `List` of the keys.

At `List`:

```
>>> [1 3 5 7 9].indices
1:5

>>> [1 3 4 2 5].indices(isOdd:/1)
[1 2 5]
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).indices
['x' 'y' 'z']

>>> (x: 1, y: 2, z: 3).indices(isEven:/1)
['y']
```

C.f. `keys`:

```
>>> (x: 1, y: 2, z: 3).keys
['x' 'y' 'z']
```

At `ListView`:

```
>>> ListView([1 .. 9], 3, 7, 1).indices
1:5

>>> ListView([1 .. 9], 3, 7, 0).indices
0:4
```

The `size` of a collection is equal to the size of its `indices`:

```
>>> let c = 1:9;
>>> (c.size, c.indices.size)
(9, 9)

>>> let c = ListView([1 .. 9], 3, 7, 1);
>>> (c.size, c.indices.size)
(5, 5)
```

* * *

See also: deepIndices, Dictionary, includesIndex, Indexable, indicesDo, keys, withIndexDo

Guides: Dictionary Functions, List Functions

Categories: Accessing
