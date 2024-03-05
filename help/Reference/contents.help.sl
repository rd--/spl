# contents

- _contents(aStream | aString)_

The contents of a `Stream` is a `Sequence` of all of the items in the stream.

The contents of a `String` is a `List` of single character `String`s.

```
>>> 'abc'.contents
['a' 'b' 'c']
```

The inverse is `join`:

```
>>> 'mississippi'.contents.join
'mississippi'
```

* * *

See also: join, next, reset, splitBy

References:
_Smalltalk_
5.9.1.2

Categories: Accessing, String
