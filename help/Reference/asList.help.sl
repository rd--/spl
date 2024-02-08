# asList

_asList(aCollection)_

Answer a List whose elements are the elements of _aCollection_.
If the collection is a List, answer it directly.

```
>>> let l = [1 .. 5];
>>> l.asList == l
true
```

At Record:

```
>>> (x: 1, y: 2, z: 3).asList
[1 2 3]

>>> (x: 1, y: 2, z: 3).associations
['x' -> 1, 'y' -> 2, 'z' -> 3]
```

At String:

```
>>> 'string'.asList
['s' 't' 'r' 'i' 'n' 'g'].collect(asCharacter:/1)
```

This should not be defined for scalar values, see _asCollection_.

* * *

See also: List, asCollection

Categories: Converting
