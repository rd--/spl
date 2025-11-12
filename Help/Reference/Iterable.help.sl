# Iterable

`Iterable` is a collection `Trait`.

```
>>> system
>>> .traitDictionary['Iterable']
>>> .isTrait
true
```

Types implementing `Iterable`:

```
>>> system
>>> .traitTypes('@Iterable')
>>> .sort
[
	'AsciiString'
	'BitSet'
	'ByteArray'
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
	'Multiset'
	'NumericArray'
	'Range'
	'Record'
	'ResidueSet'
	'SortedList'
	'SortedSet'
	'Span'
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

To implement `Iterable` a type must provide `do`.

Iterable defines `size` in terms of `do`,
but for many types a more efficient form is possible.

* * *

See also: Collection, do, Iterator, size, Trait

Guides: Stream Functions

Categories: Trait
