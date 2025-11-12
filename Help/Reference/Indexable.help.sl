# Indexable

`Indexable` is a collection `Trait`.

```
>>> system
>>> .traitDictionary['Indexable']
>>> .isTrait
true
```

Types implementing `Indexable`:

```
>>> system
>>> .traitTypes('Indexable')
>>> .sort
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
	'RunArray'
	'SortedList'
	'Span'
	'SparseArray'
	'String'
	'TimeSeries'
	'Tree'
	'TypedDictionary'
	'UndirectedEdge'
	'WeakMap'
]
```

The required methods are:

- `at`
- `atPut`
- `indices`
- `size`

The `At Syntax` and `AtPut Syntax` are implemented in terms of `Indexable` methods.

The `Dictionary` types are `Indexable` so that one may use the indexing syntax for dictionaries.

Note, however, that `atAll` is not at `Indexable`, but instead at `Sequenceable` since it requires `species` to decide the answer type.

* * *

See also: at, atPut, Collection, includesIndex, indices, indicesDo, size, withIndexDo

Guides: Dictionary Functions, Indexing Functions, List Functions

Categories: Trait
