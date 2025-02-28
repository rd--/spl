# contents

- _contents(aBox | anIterable | aStream)_

At `Box`:

```
>>> Box(23).contents
23
```

The `contents` of an `Iterable` is a `List` of all of the items accessed by `do`.

At `Tree`:

```
>>> [1, [2, [3], 4], 5]
>>> .expressionTree(nil)
>>> .contents
>>> .collect(value:/1)
[nil 1 nil 2 nil 3 4 5]
```

The `contents` of a `CollectionStream` is a `Sequence` of all of the items in the stream.

At `DoubleQuotedString` answers the quoted string:

```
>>> "Double Quoted String".contents
'Double Quoted String'
```

At `SortedList` answers the stored list,
use `asList` to get a copy:

```
>>> [1 3 5 4 2 0].asSortedList.contents
[0 1 2 3 4 5]

>>> [1 3 5 4 2 0].asSortedList.asList
[0 1 2 3 4 5]
```

* * *

See also: asList, DoubleQuotedString, join, next, reset, splitBy, stringList

References:
_Smalltalk_
5.9.1.2

Categories: Accessing, String
