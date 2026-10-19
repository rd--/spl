# from

- _from(i)_
- _from(i, c)_

The binary form of `from` is `swap` of either `at` or `atAll`,
it selects the items at the collection _c_ having indices in _i_.

Select items from a list:

```
>>> [1 3 5 7 9].from(
>>> 	1:9 ^ 3
>>> )
[1 27 125 343 729]
```

Select items from a record:

```
>>> ['x' 'z'].from(
>>> 	(x: 1, y: 2, z: 3) ^ 3
>>> )
[1 27]
```

Select one row from a matrix:

```
>>> 2.from([3 4].iota)
[5 6 7 8]
```

The unary form answers a unary block that will select the indices _i_ from its argument:

```
>>> [3 3].iota.collect(
>>> 	[1 3].from
>>> )
[1 3; 4 6; 7 9]
```

* * *

See also: atAll

Guides: Dictionary Functions, List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/From),
_J_
[1](https://www.jsoftware.com/help/dictionary/d520.htm)
