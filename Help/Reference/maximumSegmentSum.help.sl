# maximumSegmentSum

- _maximumSegmentSum(aList)_

Answer the largest sum of any contiguous subsequence of _aList_,
along with the start and end indices of the subsequence.

```
>>> [-2].maximumSegmentSum
[-2 1 1]

>>> [1 2 3 4 5 -1 7]
>>> .maximumSegmentSum
[21 1 7]

>>> [
>>> 	2 5 10 7 3 -2 10 -1 -8 -3
>>> 	-5 6 6 -9 4 -7 -10 6 6 -9
>>> ].maximumSegmentSum
[35 1 7]

>>> [
>>> 	9 -9 -10 5 -9 -4 0 2 -5 -2
>>> 	10 -10 9 -6 -5 -10 9 5 1 0
>>> 	-9 -4 -8 -8 -2 -8 -7 -2 -7 6
>>> 	5 -4 1 5 4 2 4 7 6 -4
>>> 	-8 -10 10 5 -1 -7 2 -6 -4 6
>>> 	-1
>>> ].maximumSegmentSum
[36 30 39]

>>> [1 2 3 4 5 6 7]
>>> .maximumSegmentSum
[28 1 7]

>>> [1 2 3 4 5 -1 7 -4 -2]
>>> .maximumSegmentSum
[21 1 7]

>>> [-4 1 2 3 4 5 -1 7 -2]
>>> .maximumSegmentSum
[21 2 8]

>>> [-4 1 2 3 4 5 7 -1 -2]
>>> .maximumSegmentSum
[22 2 7]

>>> [41 -45 88 59 59 -9 97 0 -1 1]
>>> .maximumSegmentSum
[294 3 7]

>>> [2 -4 3 2 6 -10 -12 20]
>>> .maximumSegmentSum
[20 8 8]

>>> [-1].maximumSegmentSum
[-1 1 1]

>>> [-2 -1].maximumSegmentSum
[-1 2 2]

>>> [-2 1 -3 4 -1 2 1 -5 4]
>>> .maximumSegmentSum
[6 4 7]

>>> [5,4,-1,7,8]
>>> .maximumSegmentSum
[23 1 5]

>>> [1].maximumSegmentSum
[1 1 1]

>>> [1 2 3 -9 1 2 3]
>>> .maximumSegmentSum
[6 1 3]
```

* * *

See also: kadanesAlgorithm

References:
_W_
[1](https://en.wikipedia.org/wiki/Maximum_subarray_problem)
