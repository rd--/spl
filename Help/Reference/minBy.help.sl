# minBy

- _minBy(c, f:/2)_

Answers which item of the collection _c_ is the least according to the comparator _f_.

```
>>> [1 5; 3 4; 2 1; 1 3].minBy(precedes:/2)
[1 3]
```

Compare to `min`, which answers the least value in each column:

```
>>> [1 5; 3 4; 2 1; 1 3].min
[1 1]
```

`minBy` can implement `max`:

```
>>> [1 3 5 7 9].minBy(>)
9

>>> [1 3 5 7 9].max
9
```

* * *

See also: <, max, min, minOn, minimalBy, reduce, sortBy, sortOn

Guides: Sort Functions
