# minOn

- _minOn(p, q, aBlock:/1)_

Answers which of _p_ or _q_ answers as `min` according to _aBlock_,
that is the `min` accoring to the transformed _p_ and _q_,
answering either _p_ or _q_.

```
>>> -2J2.minOn(4J1, abs:/1)
-2J2

>>> [1 2 3].minOn([4 5], size:/1)
[4 5]
```

Note this is not the `min` of the transformed values:

```
>>> -2J2.abs.min(4J1.abs)
2.82843

>>> [1 2 3].size.min([4 5].size)
2
```

* * *

See also: <, maxOn, max, min, minimalBy, reduce
