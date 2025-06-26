# collatzSequence

- _collatzSequence(n)_

Answer the sequence of integers,
starting with _n_,
in which each term is obtained from the previous term as either

1. _n_ is even, then _n/2_
2. _n_ is odd, _n*3+1_

Also called a hailstone sequence.

The sequence starting at seven, which arrives at `one` after seventeen steps:

```
>>> 7.collatzSequence
[
	 7 22 11 34 17 52 26 13 40 20
	10  5 16  8  4  2  1
]
```

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

Plot the orbit for twenty-seven, which has one-hundred and twelve places:

~~~spl svg=C
27.collatzSequence.linePlot
~~~

![](sw/spl/Help/Image/collatzSequence-C.svg)

* * *

See also: isEven, isOdd, nestWhileList

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CollatzProblem.html)
[2](https://mathworld.wolfram.com/HailstoneNumber.html),
_OEIS_
[1](https://oeis.org/A070165)
[2](https://oeis.org/A008884)
[3](https://oeis.org/A006877),
_W_
[1](https://en.wikipedia.org/wiki/Collatz_conjecture)
