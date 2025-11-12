# Collection

`Collection` is a `Trait` holding behaviours common to collections.

```
>>> system
>>> .traitDictionary['Collection']
>>> .isTrait
true
```

Types implementing `Collection`:

```
>>> system
>>> .traitTypes('@Collection')
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
	'Multiset'
	'NumericArray'
	'Range'
	'Record'
	'ResidueSet'
	'SortedList'
	'SortedSet'
	'Span'
	'SparseArray'
	'Storage'
	'TimeSeries'
	'TypedDictionary'
	'UnsortedSet'
]
```

The required methods are `do` and `size`,
meaning that all collections can also implement `Iterable`:

- `do`
- `size`

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
- `select`
- `reject`
- `collect`
- `detect`
- `detectIfNone`
- `injectInto`
- `collectThenSelect`
- `selectThenCollect`
- `count`

Methods for set logic:

- `difference`

* * *

See also: Dictionary, do, Sequenceable, size

Guides: Dictionary Functions, List Functions

References:
_Smalltalk_
5.7.1

Categories: Collection, Trait
