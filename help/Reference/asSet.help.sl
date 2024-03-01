# asSet

- _asSet(aCollection)_

Answer a `Set` of the elements of _aCollection_.

At `List`:

```
>>> [1 1 2 1 2 3].asSet.size
3
```

At `Tuple`:

```
>>> (1, 1, 2, 1, 2, 3).asSet.size
3
```

At `String`:

```
>>> 'abracadabra'.asSet.size
5
```

Lists that compare `=` do not compare `==`, that is they are not `isImmediate`:

```
>>> [1 1; 1 1].basicAsSet.size
2

>>> { [1 1; 1 1].asSet }.ifError { true }
true
```

* * *

See also: basicAsSet, Collection, isImmediate, Set

Categories: Converting
