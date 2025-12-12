# inspectAsList

- _inspectAsList(x, n)_

Answer a `List` of at most _n_ indices `Association`s describing the object _x_.

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
