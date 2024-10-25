# contents

- _contents(anIterable | aStream | aCollection | aString)_

The `contents` of an `Iterable` is a `List` of all of the items accessed by `do`.
At `Tree`:

```
>>> [1, [2, [3], 4], 5].asTree.contents.collect(value:/1)
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

The `contents` of a `String` is a `List` of single character `String`s.

```
>>> 'abc'.contents
['a' 'b' 'c']
```

Inverse are `join` and `stringJoin`:

```
>>> 'mississippi'.contents.join('')
'mississippi'

>>> 'mississippi'.contents.stringJoin
'mississippi'
```

* * *

See also: join, next, reset, splitBy

References:
_Smalltalk_
5.9.1.2

Categories: Accessing, String
