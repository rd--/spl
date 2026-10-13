# addWithOccurrences!

- _addWithOccurrences!(c, x, n)_

Add the object _x_ to the collection _c_ multiple times.
The operation is equivalent to adding _x_ to _c_ _n_ times using `add`.
Answers _x_.

At `List`:

```
>>> let a = [];
>>> let b = a.addWithOccurrences!(3, 5);
>>> (a, b)
([3 3 3 3 3], 3)
```

At `Multiset`:

```
>>> let a = Multiset[];
>>> let b = a.addWithOccurrences!(3, 5);
>>> (a, b)
(Multiset[3 -> 5], 3)
```

* * *

See also: Add, add

Guides: List Functions

References:
_Smalltalk_
5.7.6.2

Categories: Adding
