# Indices

`Indices` is a collection trait for collections where the indices can be enumerated.
The trait `At` says that a collection can be accessed by index,
but does not say that it must be possibly to enumerate the indices.
At `Sequence` the indices are ordinal numbers and `indices` will answer a `Range` value,
at `Dictionary` it will answer a `List`.

The required methods are:

- `indices`

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
	'Dictionary'
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
]
```

* * *

See also: At, Collection, Put, indices

Guides: Dictionary Functions, Indexing Functions, List Functions

Categories: Trait
