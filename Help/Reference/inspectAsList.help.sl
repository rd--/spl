# inspectAsList

- _inspectAsList(anObject, maxIndices)_

Answer a `List` of at most _maxIndices_ `Association`s describing _anObject_.

```
>>> let r = (x: 0, y: 1.pi);
>>> r.inspectAsList(9)
[
	'Type' -> r.typeDefinition,
	'size' -> 2,
	'x' -> 0,
	'y' -> 1.pi
]
```

* * *

See also: Object
