# contents

- _contents(x, f/2)_

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
>>> .collect(value/1)
[nil 1 nil 2 nil 3 4 5]
```

At `DoubleQuotedString` answers the quoted string:

```
>>> "Double Quoted String".contents
'Double Quoted String'
```

At `SortedList` answers the stored list,
use `List` to get a copy:

```
>>> SortedList[1 3 5 4 2 0].contents
[0 1 2 3 4 5]

>>> let a = SortedList[1 3 5 4 2 0];
>>> let b = a.contents;
>>> let c = a.List;
>>> (b, b = c, b !== c)
([0 1 2 3 4 5], true, true)
```

* * *

See also: DoubleQuotedString, List, join, next, reset, splitBy, stringList

Guides: Stream Functions

References:
_Smalltalk_
5.9.1.2

Categories: Accessing, String
