# Indices

`Indices` is a collection trait for collections where the indices can be enumerated.
The trait `At` says that a collection can be accessed by index,
but does not say that it must be possible to enumerate the indices.
At `Sequence` the indices are ordinal numbers and `indices` will answer a `Range` value,
at `Dictionary` the answer will be a `List` of the keys.

The required methods are:

- `indices`
- `size`

Implemented methods include:

- `indicesDo`
- `includesIndex`
- `includesIndices`
- `indexOf`
- `indexOfIfAbsent`
- `isIndexable`
- `positionIndex`
- `positionSmallest`
- `withIndexDo`

`Indices` is a `Trait`:

```
>>> system
>>> .traitDictionary['Indices']
>>> .isTrait
true
```

Types implementing `Indices`:

```
>>> system
>>> .traitTypes('@Indices')
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
	'Range'
	'Record'
	'RunArray'
	'SortedList'
	'SparseArray'
	'String'
	'TimeSeries'
	'Tree'
	'TypedDictionary'
	'UndirectedEdge'
]
```

* * *

See also: At, Collection, Put, indices

Guides: Collection Functions, Dictionary Functions, Indexing Functions, List Functions

Categories: Trait
