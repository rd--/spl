# nest

- _nest(x)_

Enclose the object _x_ in a `List` only if it is not a list.
Answers either a `List` of one place, holding _x_, or _x_.

```
>>> 1.nest
[1]

>>> [1].nest
[1]

>>> [1 2 3] + [4 5 6].nest
[5 7 9]

>>> 'x'.nest
['x']
```

* * *

See also: enclose

References:
_Apl_
[1](https://aplwiki.com/wiki/Nest)
