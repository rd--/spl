# contents

- _contents(x, f:/2)_

Answer the contents of _x_.
The `contents` of an `Iterable` object is a `List` of all of the items accessed by _f_, or by `do`.

At `Box`:

```
>>> Box(23).contents
23
```

At `Tuple`:

```
>>> (1, 2, 3).contents
[1 2 3]
```

At `Tree`:

```
>>> [1, [2, [3], 4], 5]
>>> .expressionTree(nil)
>>> .contents
>>> .collect(value:/1)
[nil 1 nil 2 nil 3 4 5]
```

At `DoubleQuotedString` answers the quoted string:

```
>>> "Double Quoted String".contents
'Double Quoted String'
```

At `SortedList` answers the stored list,
use `asList` to get a copy:

```
>>> [1 3 5 4 2 0].SortedList.contents
[0 1 2 3 4 5]

>>> [1 3 5 4 2 0].SortedList.asList
[0 1 2 3 4 5]
```

* * *

See also: asList, DoubleQuotedString, join, next, reset, splitBy, stringList

Guides: Stream Functions

References:
_Smalltalk_
5.9.1.2

Categories: Accessing, String
