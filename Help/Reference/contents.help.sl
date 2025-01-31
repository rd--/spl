# contents

- _contents(aBox | anIterable | aStream | aCollection | aString | aQuotedString)_

At `Box`:

```
>>> Box(23).contents
23
```

The `contents` of an `Iterable` is a `List` of all of the items accessed by `do`.

At `Tree`:

```
>>> [1, [2, [3], 4], 5]
>>> .asTree
>>> .contents
>>> .collect(value:/1)
[nil 1 nil 2 nil 3 4 5]
```

The `contents` of a `Stream` is a `Sequence` of all of the items in the stream.

The `contents` of a `Collection` is the collection itself.

At `Record`:

```
>>> let r = (x: 1, y: 2);
>>> r.contents == r
true
```

The `contents` of a `String` is a `List` of single character `String`s,
this behaviour is also called `stringList`:

```
>>> 'abc'.contents
['a' 'b' 'c']

>>> 'abc'.stringList
['a' 'b' 'c']
```

Inverse are `join` and `stringJoin`:

```
>>> 'mississippi'.contents.join('')
'mississippi'

>>> 'mississippi'.contents.stringJoin
'mississippi'
```

The `contents` of quoted strings are the quoted `String` values:

```
>>> "Double Quoted String".contents
'Double Quoted String'

>>> `Backtick Quoted String`.contents
'Backtick Quoted String'
```

* * *

See also: BacktickQuotedString, DoubleQuotedString, join, next, reset, splitBy, stringList

References:
_Smalltalk_
5.9.1.2

Categories: Accessing, String
