# uncheckedStringIntercalate

- _uncheckedStringIntercalate(l, x)_

Join together the items of the list _l_, somehow converted to strings, intercalating the object _x_ between each.

At integer list with integer separator:

```
>>> [1 2 3].uncheckedStringIntercalate(4)
'14243'
```

At integer matrix with integer separator:

```
>>> [1; 2; 3].uncheckedStringIntercalate(4)
'14243'
```

At real list with string separator:

```
>>> [2.pi 2.sqrt].uncheckedStringIntercalate(',')
'6.283185307179586,1.4142135623730951'
```

* * *

See also: join, stringIntercalate, stringJoin

Guides: Unchecked Functions
