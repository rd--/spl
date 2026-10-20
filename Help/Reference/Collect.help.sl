# Collect

`Collect` is a collection trait.

The required method is:

- `collect`

`Collect` is a `Trait`:

```
>>> system
>>> .traitDictionary['Collect']
>>> .isTrait
true
```

Types implementing the `Collect` trait:

```
>>> system
>>> .traitTypes('@Collect')
>>> .sort!
[
	'AsciiString'
	'BitSet'
	'BlockStream'
	'ByteArray'
	'CollectionStream'
	'Dictionary'
	'Float32Array'
	'Float64Array'
	'IdentityMultiset'
	'IdentitySet'
	'LinkedList'
	'List'
	'ListView'
	'Map'
	'MemoizationTable'
	'Multiset'
	'NumericArray'
	'Range'
	'Record'
	'ResidueSet'
	'SortedList'
	'SortedSet'
	'SparseArray'
	'Storage'
	'TimeSeries'
	'TypedDictionary'
	'UnsortedSet'
]
```

* * *

See also: Add, At, Collection, Do, Put, Remove

Guides: Collection Functions, List Functions
