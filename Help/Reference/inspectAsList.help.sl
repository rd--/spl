# inspectAsList

- _inspectAsList(anObject, maxIndices)_

Answer a `List` of at most _maxIndices_ `Association`s describing _anObject_.

```
>>> let r = (x: 0, y: pi);
>>> r.inspectAsList(9)
['Type' -> r.typeDefinition, 'size' -> 2, 'x' -> 0, 'y' -> pi]
```

* * *

See also: Object
