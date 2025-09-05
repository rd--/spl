# asSet

- _asSet(c)_

Answer a `Set` of the elements of the collection _c_.

At `IdentityBag`:

```
>>> [1 1 2 1 2 3]
>>> .asIdentityBag
>>> .asSet
[1 2 3].Set
```

At `String`:

```
>>> 'abracadabra'
>>> .asSet
Set(['a' 'b' 'r' 'c' 'd'])
```

At a list of lists:

```
>>> [1 1; 1 1].asSet
Set([[1 1]])
```

* * *

See also: asIdentitySet, Collection, IdentitySet, nub, Set

References:
_Smalltalk_
5.7.1.7

Categories: Converting
