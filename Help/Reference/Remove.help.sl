# Remove

`Remove` is a collection `Trait` holding behaviours common to contractible collections.

```
>>> system
>>> .traitDictionary['@Remove']
>>> .isTrait
true
```

The required method is:

- `removeIfAbsent`

Provided methods are:

- `remove`
- `removeAll`
- `removeAllFoundIn`
- `removeAllSuchThat`
- `without`
- `withoutAll`

Types implementing `Remove`:

```
>>> system
>>> .traitTypes('@Remove')
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

See also: Add, Collection

Guides: Collection Functions

References:
_Smalltalk_
5.7.16

Categories: Collection, Trait
