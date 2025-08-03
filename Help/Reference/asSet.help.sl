# asSet

- _asSet(c, f:/2)_

Answer a `Set` of the elements of the collection _c_ using the comparison predicate _f_.

At `List` with `==` answers an `IdentitySet`:

```
>>> let s = [1 1 2 1 2 3].asSet(==);
>>> (s.isIdentitySet, s.size)
(true, 3)
```

At `Tuple`:

```
>>> (1, 1.0001, 2, 1, 2.00001, 3).asSet(~).size
3
```

At `IdentityBag`:

```
>>> [1 1 2 1 2 3].asIdentityBag.asSet(==)
[1 2 3].asIdentitySet
```

At `String`:

```
>>> 'abracadabra'.asSet(==).size
5
```

Lists that compare `=` do not compare `==`,
`IdentitySet` refuses to construct a `Set` with non-immediate values:

```
>>> [1 1; 1 1].asSet(=).size
1

>>> {
>>> 	[1 1; 1 1].asSet(==)
>>> }.ifError { true }
true
```

* * *

See also: asIdentitySet, Collection, IdentitySet, isImmediate, nub, Set

References:
_Smalltalk_
5.7.1.7

Categories: Converting
