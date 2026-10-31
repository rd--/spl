# removeAll!

- _removeAll!(c)_
- _removeAll!(c₁, c₂)_

In the unary case remove all items from the collection _c_ in-place.
Answers `nil`.

```
>>> let c = [1 2 3];
>>> (c, c.removeAll!)
([], nil)

>>> let c = (x: 1, y: 2, z: 3);
>>> (c, c.removeAll!)
((:), nil)
```

In the binary case remove all items in the collection _c₂_ from the collection _c₁_.
Multiples of items in _c₁_ will not necessarily be removed.
Answers `nil`.

```
>>> let c = [1 2 3];
>>> (c, c.removeAll!([1 2]))
([3], nil)

>>> let c = (x: 1, y: 2, z: 3);
>>> (c, c.removeAll!(['x' -> 1, 'y' -> 2]))
((z: 3), nil)
```

It is an error if an item requested to be removed is not present,
see instead `removeAllFoundIn`:

```

>>> {
>>> 	[1 2 3].removeAll!([4])
>>> }.hasError
true
```

At `Storage` will remove all entries, c.f. `localStorage`

* * *

See also: remove, removeAllEqualTo, removeAllFoundIn, removeAllSuchThat, removeAt, removeAtAll

Guides: Dictionary Functions, List Functions

References:
_Smalltalk_
5.7.5.5

Categories: Removing
