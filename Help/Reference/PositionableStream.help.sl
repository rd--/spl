# PositionableStream

Collection trait.
A `Stream` over a sequence that is accessed by indices where the point of access can be repositioned.

Required methods are:

- `isAtEnd`
- `position`

List of types implementing `PositionableStream`:

```
>>> system
>>> .traitTypes('@PositionableStream')
>>> .sort!
[
	'CollectionStream'
	'MutableCollectionStream'
]
```

* * *

See also: Stream, isAtEnd, peek

Guides: Stream Functions
