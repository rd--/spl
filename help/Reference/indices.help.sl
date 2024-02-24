# indices

_indices(aCollection)_
_indices(aCollection, aBlock:/1)_

Answer the valid indices for _aCollection_.
The binary form only answers indices where the associated item satisifes the predicate _aBlock_.

For Sequences, _indices_ is the interval _(1 .. aCollection.size)_.

At List:

```
>>> [1 3 5 7 9].indices
1:5

>>> [1 3 4 2 5].indices(isOdd:/1)
[1 2 5]
```

At Tuple:

```
>>> (1, 3, 5, 7, 9).indices
1:5

>>> (1, 3, 4, 2, 5).indices(isEven:/1)
[3 4]
```

At Record:

```
>>> (x: 1, y: 2, z: 3).indices
['x' 'y' 'z']

>>> (x: 1, y: 2, z: 3).indices(isEven:/1)
['y']

>>> (x: 1, y: 2, z: 3).keys
['x' 'y' 'z']
```

* * *

See also: deepIndices, Dictionary, includesIndex, Indexable, keys

Categories: Accessing
