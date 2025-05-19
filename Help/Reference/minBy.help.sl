# minBy

- _minBy(c, f:/2)_

Answers which item of the collection _c_ is the least according to the comparator _f_.

```
>>> [1 2; 3 4; 2 1; 1 0].minBy(precedes:/2)
[1 0]
```

* * *

See also: <, max, min, minOn, minimalBy, reduce, sortBy, sortOn
