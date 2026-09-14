# Extensible

`Extensible` is a `Collection` `Trait` holding behaviours common to extensible collections.

To implement `Extensible` a type must define `add`.

```
>>> system
>>> .traitDictionary['Extensible']
>>> .isTrait
true
```

Types implementing `Collection`:

```
>>> system
>>> .traitTypes('@Extensible')
>>> .sort
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

Methods for adding: `add`, `addAll`

* * *

See also: add, Collection, Removable

Categories: Collection, Trait
