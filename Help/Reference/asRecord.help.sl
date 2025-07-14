# asRecord

- _asRecord(c)_

Convert the collection _c_ to a `Record`.

At a `List` of `Association` values:

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

It is an `error` if the matrix does not have `String` items in the first column,
or does not have two columns:

```
>>> {
>>> 	[1 2; 3 4; 5 6].asRecord
>>> }.ifError { true }
true

>>> {
>>> 	['x' 1 2; 'y' 3 4; 'z' 5 6].asRecord
>>> }.ifError { true }
true
```

At a `Map`:

```
>>> (x: 1, y: 2, z: 3).asMap.asRecord
(x: 1, y: 2, z: 3)
```

* * *

See also: asList, asMap, Association, Dictionary, List, Map, Record

Guides: Dictionary Functions

Categories: Converting
