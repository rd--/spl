# Collection

`Collection` is a trait holding behaviours common to collections.
Collections should ordinarily implement `Do` and `New`.

The required methods are:

- `collect`
- `select`

Methods for testing

- `allSatisfy`
- `anySatisfy`
- `includesAll`
- `includesAny`
- `includes`
- `isEmpty`
- `occurrencesOf`

Methods for enumerating:

- `do`
- `doSeparatedBy`
- `reject`
- `detect`
- `detectIfNone`
- `injectInto`
- `collectThenSelect`
- `selectThenCollect`
- `count`

Methods for set logic:

- `difference`

`Collection` is a `Trait`:

```
>>> system
>>> .traitDictionary['@Collection']
>>> .isTrait
true
```

Types implementing `Collection`:

```
>>> system
>>> .traitTypes('@Collection')
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
	'IdentitySet'
	'Link'
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

Guides: Collection Functions, Dictionary Functions, List Functions

References:
_Smalltalk_
5.7.1

Categories: Collection, Trait
