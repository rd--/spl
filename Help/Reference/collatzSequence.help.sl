# collatzSequence

- _collatzSequence(anInteger)_

Answer the sequence of integers in which each term is obtained from the previous term as either

1. if a term is even, the next term is one half of it
2. if a term is odd, the next term is three times the previous term plus one.

The sequence starting at nine, which arrives at `one` after nineteen steps:

```
>>> 9.collatzSequence
[
	9 28 14 7 22 11 34 17 52 26
	13 40 20 10 5 16 8 4 2 1
]
```

The table of sequences obtained for the first few starting values,
OEIS [A070165](http://oeis.org/A070165):

```
>>> 1:6.collect(collatzSequence:/1)
[
	1;
	2 1;
	3 10 5 16 8 4 2 1;
	4 2 1;
	5 16 8 4 2 1;
	6 3 10 5 16 8 4 2 1
]
```

Plot the number of steps required to reach one for the first few integers:

~~~spl svg=A
1:200.collect { :each |
	each.collatzSequence.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-A.svg)

Plot the `log` of the maximum value in each orbit for the first few integers:

~~~spl svg=B
1:200.collect { :each |
	each.collatzSequence.max.log
}.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-B.svg)

* * *

See also: isEven, isOdd

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CollatzProblem.html),
_OEIS_
[1](https://oeis.org/A070165),
_W_
[1](https://en.wikipedia.org/wiki/Collatz_conjecture)
