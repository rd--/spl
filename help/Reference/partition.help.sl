# partition

- _partition(aSequence, windowSize, stepSize)_
- _partition(alpha, beta)_ => _partition(alpha, beta, beta)_

Answer a sequence of arrays of _windowSize_ places,
each is a subsequence of _aSequence_,
starting _stepSize_ places after the last.

If the _stepSize_ is less than the _windowSize_ the windows will overlap:

```
>>> [1 .. 9].partition(3, 2)
[1 2 3; 3 4 5; 5 6 7; 7 8 9]
```

If the _stepSize_ is greater than the _windowSize_ there will be gaps:

```
>>> [1 .. 9].partition(3, 4)
[1 2 3; 5 6 7]
```

If the _stepSize_ is equal to the _windowSize_ the concatenation of the answer will be the original sequence:

```
>>> [1 .. 9].partition(3, 3)
[1 2 3; 4 5 6; 7 8 9]

>>> [1 .. 9].partition(3, 3).concatenation
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
>>> [1 0 1 1 1 0 1 0 0 0 1 1 0 0 0].partition(2, 1)
[1 0; 0 1; 1 1; 1 1; 1 0; 0 1; 1 0; 0 0; 0 0; 0 1; 1 1; 1 0; 0 0; 0 0]
```

Find successive ratios in a list:

```
>>> [1 .. 5].partition(2, 1).collect(asFraction:/1)
[1/2 2/3 3/4 4/5]
```

In some cases _concatenation_ is an inverse of _partition_:

```
>>> let l = [1 .. 6];
>>> l.partition(2).concatenation
l
```

* * *

See also: pairsCollect, pairsDo, partitionDo, windowedReduce

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Partition.html)
