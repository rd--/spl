# Add

`Add` is a `Collection` `Trait` holding behaviours common to extensible collections.

```
>>> system
>>> .traitDictionary['Add']
>>> .isTrait
true
```

The required method is:

- `add`

Provided methods are:

- `addAll`
- `addAllIfNotPresent`
- `addIfNotPresent`
- `addWithOccurrences`
- `fillFromWith`
- `ifAbsentAdd`
- `include`
- `includeAll`

Types implementing `Add`:

```
>>> system
>>> .traitTypes('@Add')
>>> .sort!
[
	'BitSet'
	'Dictionary'
	'Heap'
	'IdentityMultiset'
	'IdentitySet'
	'LinkedList'
	'List'
	'Map'
	'Multiset'
	'Record'
	'ResidueSet'
	'SortedList'
	'SortedSet'
	'TypedDictionary'
	'UnsortedSet'
]
```

* * *

See also: Collection, Remove

Guides: Collection Functions

References:
_Smalltalk_
5.7.16

Categories: Collection, Trait
