# median

- _median(aSequence)_

When the sequence is sorted the median is given by the `middle` element if the sequence length is odd,
and the `mean` of the two center elements if it is even.

Odd length sequence:

```
>>> (1:7.median, 1:7[4], 1:7.middle)
(4, 4, 4)
```

Even length sequence:

```
>>> (
>>> 	1:8.median,
>>> 	(1:8[4] + 1:8[5]) / 2,
>>> 	1:8.middle(2).mean
>>> )
(4.5, 4.5, 4.5)
```

Find the `median` for the heights of children in a class:

```
>>> [
>>> 	134 143 131 140 145 136 131 136 143
>>> 	136 133 145 147 150 150 146 137 143
>>> 	132 142 145 136 144 135 141
>>> ].median
141
```

Note that `median` sorts the input sequence:

```
>>> [1 7 6 2 3 5 4].median
4

>>> [1 2 3 4 5 6 7].median
4
```

* * *

See also: asSortedList, isEven, isOdd, mean, middle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Median.html)
[2](https://reference.wolfram.com/language/ref/Median.html)
