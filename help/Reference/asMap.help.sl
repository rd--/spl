# asMap

- _asMap(anAssociationList | aBag | aRecord)_

Construct a `Map` from a `List` of associations, or from a `Bag` or `Record`.

```
>>> ['x' -> 1, 'y' -> 2].asMap.isMap
true

>>> (x: 1, y: 2).asMap.isMap
true

>>> [1 2 2 3 3 3].asBag.asMap
[1 -> 1, 2 -> 2, 3 -> 3].asMap
```

* * *

See also: ->, Association, Bag, List, Map, Record
