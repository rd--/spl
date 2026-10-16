# Do

`Do` is a collection `Trait`.

```
>>> system
>>> .traitDictionary['Do']
>>> .isTrait
true
```

To implement `Do` a type must provide `do`.

Do defines `size` in terms of `do`,
but for many types a more efficient form is possible.

Types implementing `Do`:

```
>>> system
>>> .traitTypes('@Do')
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
	'Heap'
	'IdentityMultiset'
	'IdentitySet'
	'LinkedList'
	'List'
	'ListView'
	'Map'
	'Markdown'
	'MemoizationTable'
	'Multiset'
	'NumericArray'
	'Range'
	'Record'
	'ResidueSet'
	'SortedList'
	'SortedSet'
	'SparseArray'
	'String'
	'SymbolicExpression'
	'TimeSeries'
	'Tree'
	'TypedDictionary'
	'UnsortedSet'
	'URLSearchParams'
]
```

* * *

See also: Collect, Iterator, Trait, do, size

Guides: Stream Functions

Categories: Trait
