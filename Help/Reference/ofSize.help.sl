# ofSize

- _ofSize(f:/1, n)_
- _ofSize(c, n)_

At `Block`,
evaluate the unary block _f_ using `cull` at _n_ to create a new collection,
and the call `ofSize` at _n_ to ensure the collection is correctly sized,
with `nil` as every element:

```
>>> [].species.ofSize(3)
[nil nil nil]

>>> [].species.cull(3).ofSize(3)
[nil nil nil]
```

At `Collection`,
ensure the collection _c_ has _n_ places:

```
>>> [1 2 3].ofSize(3)
[1 2 3]
```

Any newly created places have nil as the element:

```
>>> [1 2 3].ofSize(5)
[1 2 3 nil nil]
```

If the collection has as many or more places than requested, it is answered unchanged:

```
>>> [1 2 3 4 5].ofSize(3)
[1 2 3 4 5]
```

_Rationale_:
This method exists because for some collection types the species block may create an empty collection.
It implements the Smalltalk idiom that allows `collect` to answer a collection of the required type.

```
>>> [].species.ofSize(3)
[nil nil nil]
```

* * *

See also: new, newFrom, species

Guides: Dictionary Functions, List Functions

Categories: Instance Creation, Reflection
