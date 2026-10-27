# Link

- _Link(x, l)_

`Link` is a both a collection trait and a type representing a `Link` in a linked list.
The stored value is _x_,
the next link is _l_,
which may be `nil` to indicate there is no next link.

```
>>> let a = Link(1, nil);
>>> (a.value, a.nextLink, a.size)
(1, nil, 1)
```

The required methods are:

- `nextLink`
- `previousLink`
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
>>> .traitDictionary['@Link']
>>> .isTrait
true
```

Types implementing the `Link` trait:

```
>>> system
>>> .traitTypes('@Link')
>>> .sort!
[
	'Link'
]
```

Traits implemented by `Link`:

```
>>> system.typeLookup('Link')
>>> .traitNameList
>>> .sort!
[
	'@Collection'
	'@Copy'
	'@Do'
	'@Equal'
	'@Link'
	'@Object'
	'@Store'
]
```

* * *

See also: LinkedList, List

Guides: Collection Functions, List Functions
