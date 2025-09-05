# asIdentitySet

- _asIdentitySet(aCollection)_

Answer a `IdentitySet` of the elements of _aCollection_.

At `List`:

```
>>> [1 1 2 1 2 3].asIdentitySet
>>> .contents
[1 2 3]
```

At `Tuple`:

```
>>> (1, 1, 2, 1, 2, 3).asIdentitySet.size
3
```

At `IdentityBag`:

```
>>> [1 1 2 1 2 3]
>>> .asIdentityBag
>>> .asIdentitySet
[1 2 3].asIdentitySet
```

At `String`:

```
>>> 'abracadabra'.asIdentitySet.size
5
```

Lists that compare `=` do not compare `==`,
`asIdentitySet` refuses to construct a set with non-immediate values:

```
>>> {
>>> 	[1 1; 1 1].asIdentitySet
>>> }.ifError { true }
true
```

* * *

See also: Collection, IdentitySet, isImmediate, nub, Set

References:
_Smalltalk_
5.7.1.7

Categories: Converting
