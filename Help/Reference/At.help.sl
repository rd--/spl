# At

`At` is a collection `Trait`.

```
>>> system
>>> .traitDictionary['At']
>>> .isTrait
true
```

The required methods are:

- `at`
- `indices`
- `size`

`At Syntax` is implemented in terms of `At` methods.

Note, however, that `atAll` is not implemented at `At`.
Instead is is implemented at `Sequence` since it requires `species` to decide the answer type.

Types implementing `At`:

```
>>> system
>>> .traitTypes('@At')
>>> .sort!
[
	'AsciiString'
	'ByteArray'
	'CartesianCoordinates'
	'Dictionary'
	'DirectedEdge'
	'Float32Array'
	'Float64Array'
	'Heap'
	'LinkedList'
	'List'
	'ListView'
	'Map'
	'NumericArray'
	'PlanarCoordinates'
	'Range'
	'Record'
	'RelativeRange'
	'RunArray'
	'SortedList'
	'SparseArray'
	'String'
	'TimeSeries'
	'Tree'
	'TypedDictionary'
	'UndirectedEdge'
	'WeakMap'
]
```

* * *

See also: Collection, Put, at, includesIndex, indices, indicesDo, put, size, withIndexDo

Guides: Dictionary Functions, Indexing Functions, List Functions

Categories: Trait
