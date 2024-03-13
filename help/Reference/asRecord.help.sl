# asRecord

- _asRecord(anAssociationList | aMatrix | aMap)_

Convert a collection to a `Record`.

At a `List` of `Association`:

```
>>> ['x' -> 1, 'y' -> 2, 'z' -> 3].asRecord
(x: 1, y: 2, z: 3)
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
