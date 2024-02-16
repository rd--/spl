# contents

- _contents(aStream | aString)_

The contents of a Stream is a List of all of the items in the stream.

The contents of a String is a List of single character Strings.

```
>>> 'abc'.contents
['a' 'b' 'c']
```

The inverse of _String>>contents_ is _List>>join_:

```
>>> 'mississippi'.contents.join
'mississippi'
```

* * *

See also: join, next, reset, splitBy

Categories: Accessing, String
