# addAllIfNotPresent

- _addIfNotPresent(c, [x₁ x₂ …])_

Add each item in the collection _x_ to the collection _c_ if _c_ does not already include the item.
Answers _c_.

At `List`:

```
>>> let l = [1 3 5 2 4];
>>> l.addAllIfNotPresent([3 6]);
>>> l.addAllIfNotPresent([7 8]);
>>> l
[1 3 5 2 4 6 7 8]
```

At `SortedList`:

```
>>> let l = SortedList([1 3 5 2 4]);
>>> l.addAllIfNotPresent([3 6]);
>>> l
SortedList([1 2 3 4 5 6])
```

* * *

See also: add, addIfNotPresent, ifAbsentAdd

Categories: Adding
