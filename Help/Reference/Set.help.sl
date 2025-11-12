# Set

- _Set([x₁ x₂ …])_

`Set` is both a `Trait`,
holding behaviours for collection types that do not contain duplicate items,
and an alias for the `SortedSet` type.

```
>>> system
>>> .traitDictionary['Set']
>>> .isTrait
true
```

Types implementing the `Set` trait:

```
>>> system
>>> .traitTypes('@Set')
>>> .sort
[
	'IdentitySet'
	'SortedSet'
	'UnsortedSet'
]
```

The empty set constructor,
also a `Set` from an empty list:

```
>>> Set().size
0

>>> Set([]).size
0
```

Set predicates:

```
>>> Set().isSet
true

>>> Set().isSortedSet
true

>>> Set().isIdentitySet
false
```

Sets are collections,
and have the expected mathematical behavior in relation to scalars:

```
>>> Set([1 2 3]) * 5
Set([5 10 15])
```

Note that `Set` may be significantly less efficient that `IdentitySet`,
however `==` has some subtle behaviours:

```
>>> 1/1 == 1/1
false

>>> 1 == 1L
false

>>> Set([1 1L])
>>> .asList
[1]

>>> {
>>> 	IdentitySet([1 1L])
>>> }.hasError
true

>>> 1J1 == 1J1
false

>>> 1J1 = 1J1
true

>>> Set([1J1 1J1])
>>> .asList
[1J1]

>>> {
>>> 	IdentitySet([1J1 1J1])
>>> }.hasError
true
```

* * *

See also: IdentitySet, SortedSet, UnsortedSet

Guides: Set Functions, Set Syntax

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Set.html),
_W_
[1](https://en.wikipedia.org/wiki/Set_(mathematics))
