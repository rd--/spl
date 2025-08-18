# addIfNotPresent

- _addIfNotPresent(c, x)_

Add the object _x_ to the collection _c_ if the collection does not already include the object.
Answers _x_.

At `SortedList`:

```
>>> let l = SortedList([1 3 5 2 4]);
>>> l.addIfNotPresent(6);
>>> l.addIfNotPresent(3);
>>> l
SortedList([1 2 3 4 5 6])
```

* * *

See also: addAllIfNotPresent, addIfNotPresentBy, ifAbsentAdd

Categories: Adding
