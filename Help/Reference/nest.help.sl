# nest

- _nest(anObject)_

Enclose _anObject_ in a `List` only if it is not a collection.
Answers either a `List` of one place, holding _anObject_, or _anObject_.

```
>>> 1.nest
[1]

>>> [1].nest
[1]

>>> [1 2 3] + [4 5 6].nest
[5 7 9]
```

* * *

See also: enclose

References:
_Apl_
[1](https://aplwiki.com/wiki/Nest)
