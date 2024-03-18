# asRecord

- _asRecord(anAssociationList | aMatrix | aMap)_

Convert a collection type to a `Record`.

At a `List` of `Association`s:

```
>>> ['x' -> 1, 'y' -> 2, 'z' -> 3].asRecord
(x: 1, y: 2, z: 3)

>>> ['A' -> ['B' 'C']].asRecord
(A: ['B' 'C'])
```

At a `List` holding a 2-column _matrix_:

```
>>> ['x' 1; 'y' 2; 'z' 3].asRecord
(x: 1, y: 2, z: 3)
```

At a `Map`:

```
>>> (x: 1, y: 2, z: 3).asMap.asRecord
(x: 1, y: 2, z: 3)
```

* * *

See also: asList, Association, List, Map, Record

Categories: Converting
