# Link

`Link` is a collection trait.

The required methods are:

- `nextLink`
- `value`

Implemented methods are:

- `do`
- `lastLink`
- `linkAt`
- `linkOf`
- `linksDo`
- `linkToList`

`Link` is a `Trait`:

```
>>> system
>>> .traitDictionary['Link']
>>> .isTrait
true
```

Types implementing the `Link` trait:

```
>>> system
>>> .traitTypes('@Link')
>>> .sort!
[
	'ValueLink'
]
```

* * *

See also: LinkedList, ValueLink

Guides: Collection Functions, List Functions
