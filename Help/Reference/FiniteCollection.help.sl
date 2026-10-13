# FiniteCollection

`FiniteCollection` is a `Trait` holding behaviours common to finite collections.

```
>>> system
>>> .traitDictionary['FiniteCollection']
>>> .isTrait
true
```

Types implementing `FiniteCollection`:

```
>>> system
>>> .traitTypes('@FiniteCollection')
>>> .sort
[
	'AsciiString'
	'BitSet'
	'ByteArray'
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
	'RelativeRange'
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

The required methods are `do` and `size`,
meaning that all collections can also implement `Do`:

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

See also: Dictionary, Sequence, do, size

Guides: Dictionary Functions, List Functions

References:
_Smalltalk_
5.7.1

Categories: Collection, Trait
