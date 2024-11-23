# asList

- _asList(aCollection)_

Answer a `List` whose elements are the elements of _aCollection_.
If the collection is a `List`, answer it directly.

```
>>> let l = [1 .. 5];
>>> l.asList == l
true
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).asList
[1 2 3]

>>> (x: 1, y: 2, z: 3).associations
['x' -> 1, 'y' -> 2, 'z' -> 3]
```

At `Bag`:

```
>>> [1 2 2 3 3 3 4 4 4 4].asBag.asList
[1 2 2 3 3 3 4 4 4 4]
```

At `String`:

```
>>> 'string'.asList
['s' 't' 'r' 'i' 'n' 'g']
```

At `Matrix`:

```
>>> [1 2; 3 4; 5 6].asMatrix.asList
[1 2; 3 4; 5 6]
```

This should not be defined for scalar values, see _asCollection_.

* * *

See also: List, asCollection

References:
_Smalltalk_
5.7.1.3

Categories: Converting
