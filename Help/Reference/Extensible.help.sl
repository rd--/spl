# Extensible

`Extensible` is a `Collection` `Trait` holding behaviours common to extensible collections.

```
>>> system
>>> .traitDictionary['Extensible']
>>> .isTrait
true
```

Extensible has two parts,
the first concerned with adding items to the collection,
the second with removing items from the collection.

For adding, the required method is:

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

For removing, the required method is:

- `removeIfAbsent`

Provided methods are:

- `remove`
- `removeAll`
- `removeAllFoundIn`
- `removeAllSuchThat`
- `without`
- `withoutAll`

Types implementing `Extensible`:

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

* * *

See also: add, Collection, Extensible, remove, removeAll, removeIfAbsent, without, withoutAll

References:
_Smalltalk_
5.7.16

Categories: Collection, Trait
