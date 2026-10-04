# Indexable

`Indexable` is a collection `Trait`.

```
>>> system
>>> .traitDictionary['Indexable']
>>> .isTrait
true
```

The required methods are:

- `at`
- `put`
- `indices`
- `size`

The `At Syntax` and `Put Syntax` are implemented in terms of `Indexable` methods.

The `Dictionary` types are `Indexable` so that one may use the indexing syntax for dictionaries.

Note, however, that `atAll` is not implemented at `Indexable`.
Instead is is implemented at `Sequence` since it requires `species` to decide the answer type.

Types implementing `Indexable`:

```
>>> system
>>> .traitTypes('@Indexable')
>>> .sort!
[
	'AsciiString'
	'ByteArray'
	'CartesianCoordinates'
	'Dictionary'
	'DirectedEdge'
	'Float32Array'
	'Float64Array'
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

See also: at, Collection, includesIndex, indices, indicesDo, put, size, withIndexDo

Guides: Dictionary Functions, Indexing Functions, List Functions

Categories: Trait
