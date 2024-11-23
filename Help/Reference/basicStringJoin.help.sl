# basicStringJoin

- _basicStringJoin(aList, anObject)_

Join together the items of _aList_, somehow converted to strings, intercalating _anObject_ between each.

At integer list with integer separator:

```
>>> [1 2 3].basicStringJoin(4)
'14243'
```

At integer matrix with integer separator:

```
>>> [1; 2; 3].basicStringJoin(4)
'14243'
```

At real list with string separator:

```
>>> [2.pi 2.sqrt].basicStringJoin(',')
'6.283185307179586,1.4142135623730951'
```

* * *

See also: join, stringJoin, stringJoin
