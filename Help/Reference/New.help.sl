# New

`New` is a collection `Trait`.

The required method is:

- `species`

The provided methods are:

- `new`
- `newFrom`

`species` answers a block that can be used to contruct a value of the requires type.

`New` is a `Trait`:

```
>>> system
>>> .traitDictionary['New']
>>> .isTrait
true
```

Types implementing `New`:

```
>>> system
>>> .traitTypes('@New')
>>> .sort!
[
	'AsciiString'
	'ByteArray'
	'Float32Array'
	'Float64Array'
	'IdentityMultiset'
	'IdentitySet'
	'LinkedList'
	'List'
	'ListView'
	'Map'
	'Multiset'
	'Range'
	'Record'
	'RelativeRange'
	'ResidueSet'
	'SortedList'
	'SortedSet'
	'UnsortedSet'
]
```

* * *

See also: new, newFrom, species

Guides: Collection Functions
