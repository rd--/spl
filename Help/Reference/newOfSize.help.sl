# newOfSize

- _newOfSize(c, n)_

Make a new collection like _c_ that has _n_ places with `nil` as every element.

```
>>> let a = [];
>>> let b = a.new(3);
>>> (b, a !== b)
([nil nil nil], true)

>>> let a = LinkedList[];
>>> let b = a.new(3);
>>> (b, a = b, a == b)
(LinkedList[], true, false)

>>> let a = LinkedList[];
>>> let b = a.newOfSize(3);
>>> (b, a = b, a == b)
(LinkedList[nil nil nil], false, false)
```

_Rationale_:
This method exists because for some collection types,
for instance `LinkedList`,
the binary `new` may create an empty collection.
`new` cannot,
in general,
be required to create collections of a particular size since some collections,
such as sets,
cannot have duplicate elements.

* * *

See also: New, extendToSize!, new, newFrom, species

Guides: Dictionary Functions, List Functions

Categories: Instance Creation, Reflection
