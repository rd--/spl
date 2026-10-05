# items

- _items(x, f/2)_

Answer the items of _x_.
The `items` of an `Iterable` object is a `List` of all of the items accessed by _f_, or by `do`.

At `Tree`:

```
>>> [1, [2, [3], 4], 5]
>>> .expressionTree(nil)
>>> .items
>>> .collect(value/1)
[nil 1 nil 2 nil 3 4 5]
```

At `SortedList`:

```
>>> SortedList[1 3 5 4 2 0].items
[0 1 2 3 4 5]
```

* * *

See also: DoubleQuotedString, List, join, next, reset, splitBy, stringList

Guides: Stream Functions

References:
_Smalltalk_
5.9.1.2

Categories: Accessing, String
