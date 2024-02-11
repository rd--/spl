# indices

_indices(aCollection)_

Answer the valid indices for _aCollection_.

For Sequences, _indices_ is the interval _(1 .. aCollection.size)_.

At List:

```
>>> [1 3 5 7 9].indices
1:5
```

At Tuple:

```
>>> (1, 3, 5, 7, 9).indices
1:5
```

At Record:

```
>>> (x: 1, y: 2, z: 3).indices
['x' 'y' 'z']

>>> (x: 1, y: 2, z: 3).keys
['x' 'y' 'z']
```


* * *

See also: deepIndices, Dictionary, includesIndex, Indexable, keys

Categories: Accessing
