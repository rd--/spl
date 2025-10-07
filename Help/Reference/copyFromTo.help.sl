# copyFromTo

- _copyFromTo([x₁ x₂ …], i, j)_

Answer a copy of a subset of the sequence _x_,
starting from the element at start index _i_
and continuing until the element at stop index _j_,
inclusive of both.

At `Range`:

```
>>> 1:9.copyFromTo(3, 7)
3:7

>>> 1:16.copyFromTo(1, 8)
1:8

>>> (1, 3 .. 17).copyFromTo(3, 6)
(5, 7 .. 11)

>>> (17, 15 .. 1).copyFromTo(3, 6)
(13, 11 .. 7)
```

If indices are out of order the interval is empty:

```
>>> (1, 3 .. 17).copyFromTo(6, 3).isEmpty
true

>>> 1:1.copyFromTo(2, 1)
1:0

>>> [1 2 3].copyFromTo(1, 0)
[]

>>> [1].copyFromTo(2, 1)
[]
```

At `List`:

```
>>> [1 3 5 7 9].copyFromTo(3, 5)
[5 7 9]
```

At `String`:

```
>>> 'text'.copyFromTo(2, 4)
'ext'

>>> 'the quick brown fox jumps'
>>> .copyFromTo(17, 19)
'fox'

>>> 'text'.copyFromTo(3, 3)
'x'
```

It is an error if either index is out of bounds:

```
>>> {
>>> 	1:9.copyFromTo(-3, 5)
>>> }.hasError
true

>>> {
>>> 	1:9.copyFromTo(7, 11)
>>> }.hasError
true

>>> {
>>> 	'text'.copyFromTo(0, 3)
>>> }.hasError
true
```

* * *

See also: copy, copyFromToInto, copyFromToWrap, copyWith, copyWithout, deepCopy

Guides: Copying Functions, List Functions

References:
_Smalltalk_
5.7.8.7

Categories: Copying
