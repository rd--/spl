# Collection

`Collection` is a trait holding behaviours common to finite collections.
Collections should ordinarily implement `Do`.

The required methods are:

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

See also: Dictionary, New, Sequence, do, size

Guides: Collection Functions, Dictionary Functions, List Functions

References:
_Smalltalk_
5.7.1

Categories: Collection, Trait
