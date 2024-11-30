# indices

- _indices(aCollection)_
- _indices(aCollection, aBlock:/1)_

Answer the valid indices for _aCollection_.
The binary form only answers indices where the associated item satisifes the predicate _aBlock_.
At `Sequence`, `indices` answers a `Range` from the `firstIndex` to the `lastIndex` by `one`.

At `List`:

```
>>> [1 3 5 7 9].indices
1:5

>>> [1 3 4 2 5].indices(isOdd:/1)
[1 2 5]
```

At `Tuple`:

```
>>> (1, 3, 5, 7, 9).indices
1:5

>>> (1, 3, 4, 2, 5).indices(isEven:/1)
[3 4]
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

At `Slice`:

```
>>> 1:9.sliceFromTo(3, 7).indices
1:5
```

The `size` of a collection is equal to the size of its `indices`:

```
>>> let c = 1:9;
>>> (c.size, c.indices.size)
(9, 9)

>>> let c = 1:9.sliceFromTo(3, 7);
>>> (c.size, c.indices.size)
(5, 5)
```

* * *

See also: deepIndices, Dictionary, firstIndex, includesIndex, Indexable, indicesDo, keys, lastIndex, withIndexDo

Categories: Accessing
