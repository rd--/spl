# indexOfStartingAtBy

- _indexOfStartingAtBy(c, x, i, f:/2)_

A variant of `indexOf` allowing to specify the starting index _i_ and the comparison function _f_.

Find the index of a floating point number that `indexOf` will not find:

```
>>> [1, 1.1 .. 9]
>>> .indexOfStartingAtBy(3.1, 1, ~)
22

>>> [1, 1.1 .. 9].indexOf(3.1)
0
```

* * *

See also: =, ~, indexOf

Guides: Indexing Functions, List Functions
