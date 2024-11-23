# indicesOf

- _indicesOf(aCollection, anObject)_

Answer a `List`, possibly empty, of all the indices of _anObject_ in _aCollection_.

At `List`:

```
>>> [1 2 3 2 3 4 3 4 5].indicesOf(3)
[3 5 7]

>>> [1 2 3; 2 3 4; 3 4 5].indicesOf([2 3 4])
[2]
```

At `Record`:

```
>>> (x: 1, y: 2, z: 1).indicesOf(1)
['x' 'z']
```

At `String`:

```
>>> 'once at end'.indicesOf('d')
[11]

>>> 'abracadabra'.indicesOf('a')
[1 4 6 8 11]
```

* * *

See also: indicesOfSubstring, indexOf, occurrencesOf

Categories: Indexing
