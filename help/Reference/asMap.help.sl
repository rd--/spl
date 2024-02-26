# asMap

- _asMap(anAssociationList | aRecord)_

Construct a `Map` from a `List` of associations, or from a `Record`.

```
>>> ['x' -> 1, 'y' -> 2].asMap.isMap
true

>>> (x: 1, y: 2).asMap.isMap
true
```

* * *

See also: ->, Association, List, Map, Record
