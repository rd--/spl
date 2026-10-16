# extendToSize!

- _extendToSize!(c, n)_

Ensure the collection _c_ has _n_ places,
adding `nil` entries as required.
Answers _c_.

If _c_ already has _n_ or more places, equal to `identity`:

```
>>> let a = [1 2 3];
>>> let b = a.extendToSize!(3);
>>> (b, a == b)
([1 2 3], true)
```

Any newly created places have nil as the element:

```
>>> let a = [1 2 3];
>>> let b = a.extendToSize!(5);
>>> (b, a == b)
([1 2 3 nil nil], true)
```

If the collection has as more places than requested, it is answered unchanged:

```
>>> let a = [1 2 3 4 5];
>>> let b = a.extendToSize!(3);
>>> (b, a == b)
([1 2 3 4 5], true)
```

Sets cannot be extended,
since they cannot have duplicate elements:

```
>>> {
>>> 	Set().extendToSize!(3)
>>> }.hasError
true
```

* * *

See also: add!, size

Guides: Dictionary Functions, List Functions

Categories: Instance Creation, Reflection
