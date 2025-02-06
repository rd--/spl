# Set

- _Set(aBlock:/2)_

A `Trait` and a `Type` representing a collection of objects without duplicates.
The comparison operator is _aBlock_.

Sets with predicates other than `==` may not be at all efficient,
however `==` has some subtle behaviours:

```
>>> 1/1 == 1/1
false

>>> 1 == 1L
false
```

The empty set constructor:

```
>>> Set(=).size
0
```

Set predicate:

```
>>> Set(=).isSet
true
```

Providing the identity predicate answers an `IdentitySet`:

```
>>> Set(==).isIdentitySet
true
```

Sets are unordered collections,
and have the expected mathematical behavior in relation to scalars:

```
>>> [1 2 3].asSet(=) * 5
[5 10 15].asSet(=)
```

* * *

See also: IdentitySet
