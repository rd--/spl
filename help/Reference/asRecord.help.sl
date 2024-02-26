# asRecord

- _asRecord(anAssociationList | aMap)_

Convert a List of Association or a Map to a Record.

```
>>> ['x' -> 1, 'y' -> 2].asRecord
(x: 1, y: 2)

>>> (x: 1, y: 2).asMap.asRecord
(x: 1, y: 2)
```

* * *

See also: asList, Association, List, Map, Record

Categories: Converting
