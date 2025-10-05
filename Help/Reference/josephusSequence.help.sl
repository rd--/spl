# josephusSequence

- _josephusSequence(n, k)_

The answer to the _n,k_ Josephus problem is the last item in the _n,k_ Josephus sequence.

```
>>> 5.josephusSequence(2)
[2 4 1 5 3]

>>> 5.josephusProblem(2)
3

>>> 41.josephusSequence(3)
[
	 3  6  9 12 15 18 21 24 27 30
	33 36 39  1  5 10 14 19 23 28
	32 37 41  7 13 20 26 34 40  8
	17 29 38 11 25  2 22  4 35 16
	31
]

>>> 41.josephusProblem(3)
31
```

Plot a Josephus sequence:

~~~spl svg=A
300.josephusSequence(9)
.scatterPlot
~~~

![](sw/spl/Help/Image/josephusSequence-A.svg)

Plot the inverse permutation of the same Josephus sequence:

~~~spl svg=B
300.josephusSequence(9)
.inversePermutation
.list
.scatterPlot
~~~

![](sw/spl/Help/Image/josephusSequence-B.svg)

* * *

See also: josephusProblem

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A209258)
