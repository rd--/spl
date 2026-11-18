# inspectAsList

- _inspectAsList(x, n)_

Answer a `List` of at most _n_ indices `Association`s describing the object _x_.

```
>>> let r = (x: 0.0, y: 1.0.pi);
>>> r.inspectAsList(9L)
[
	'Type' -> r.typeDefinition,
	'size' -> 2L,
	'x' -> 0.0,
	'y' -> 1.0.pi
]
```

* * *

See also: Object

Guides: Reflection Functions
