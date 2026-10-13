# newFrom

- _newFrom(c₁, c₂)_

Make a new collection that is like the collection _c₁_,
and has the contents of the collection _c₂_.
The type of the new collection is given by the `species` of _c₁_.
The name is from Smalltalk.

At `List`,
construct a new list given a `Range`:

```
>>> [].newFrom(1:9)
[1 2 3 4 5 6 7 8 9]

>>> [].species
List/1
```

At `SortedSet`,
construct a new set given a `Range`:

```
>>> Set[].newFrom(1:9)
Set[1 2 3 4 5 6 7 8 9]

>>> Set[].species
SortedSet/0
```

* * *

See also: New, fillFrom, new, species

Guides: Collection Functions

Categories: Instance Creation, Reflection
