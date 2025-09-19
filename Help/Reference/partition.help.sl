# partition

- _partition([x₁ x₂ …], n, d=n)_

Answer a sequence of arrays of window size _n_ places,
each is a subsequence of the sequence _x_,
starting step size _d_ places after the last.

If the step size is less than the window size the windows will overlap:

```
>>> [1 .. 9].partition(3, 2)
[1 2 3; 3 4 5; 5 6 7; 7 8 9]
```

If the step size is greater than the window size there will be gaps:

```
>>> [1 .. 9].partition(3, 4)
[1 2 3; 5 6 7]
```

If the step size is equal to the window size the `catenate` of the answer will be the original sequence:

```
>>> [1 .. 9].partition(3, 3)
[1 2 3; 4 5 6; 7 8 9]

>>> [1 .. 9].partition(3, 3).++
[1 .. 9]
```

Partition into sublists of length 2:

```
>>> [1 .. 6].partition(2)
[1 2; 3 4; 5 6]
```

Partition into sublists of length 3 with offset 1:

```
>>> [1 .. 6].partition(3, 1)
[1 2 3; 2 3 4; 3 4 5; 4 5 6]
```

Incomplete sublists at the end are dropped:

```
>>> [1 .. 7].partition(3)
[1 2 3; 4 5 6]
```

Skip elements by using an offset larger than the block size:

```
>>> [1 .. 8].partition(2, 3)
[1 2; 4 5; 7 8]
```

Find pairs of successive elements in a list:

```
>>> [1 0 1 1 1 0 1 0 0 0 1 1 0 0 0]
>>> .partition(2, 1)
[
	1 0; 0 1; 1 1; 1 1; 1 0;
	0 1; 1 0; 0 0; 0 0; 0 1;
	1 1; 1 0; 0 0; 0 0
]
```

Find successive ratios in a list:

```
>>> [1 .. 5].partition(2, 1).collect { :each |
>>> 	Fraction(each.first, each.second)
>>> }
[1/2 2/3 3/4 4/5]
```

In some cases `++` (or `catenate`) is an inverse of `partition`:

```
>>> let l = [1 .. 6];
>>> l.partition(2).++
l
```

The empty sequence has no partitions:

```
>>> [].partition(2, 1)
[]
```

A sequence has one zero partition:

```
>>> 1:3.partition(0, 1)
[[]]
```

Split a list into two equal halves:

```
>>> [1 .. 10].partition(5, 5)
[1 2 3 4 5; 6 7 8 9 10]
```

At `String`:

```
>>> 'differ'.partition(2, 1)
['di' 'if' 'ff' 'fe' 'er']

>>> 'differ'.partition(2, 2)
['di' 'ff' 'er']

>>> 'differ'.partition(3, 1)
['dif' 'iff' 'ffe' 'fer']

>>> 'differ'.partition(3, 2)
['dif' 'ffe']

>>> 'differ'.partition(3, 3)
['dif' 'fer']
```

* * *

See also: clump, adjacentPairsCollect, movingMap, pairsCollect, pairsDo, partitionDo, takeList, windowedReduce

Guided: List Functions, String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Partition.html)
