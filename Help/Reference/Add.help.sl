# Add

`Add` is a collection trait holding behaviours common to extensible collections.

The required method is:

- `add!`

Provided methods include:

- `addAll!`
- `addAllIfNotPresent!`
- `addIfNotPresent!`
- `addWithOccurrences!`
- `fillFromWith!`
- `ifAbsentAdd!`
- `include!`
- `includeAll!`

`Add` is a `Trait`:

```
>>> system
>>> .traitDictionary['@Add']
>>> .isTrait
true
```

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
