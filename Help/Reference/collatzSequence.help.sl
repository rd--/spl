# collatzSequence

- _collatzSequence(n)_

Answer the Collatz sequence of integers,
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

The number of steps required to reach one for the first few integers,
OEIS [A006577](https://oeis.org/A006577):

```
>>> 1:18.collect { :each |
>>> 	each.collatzSequence.size - 1
>>> }
[0 1 7 2 5 8 16 3 19 6 14 9 9 17 17 4 12 20]
```

Plot:

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

Plot numbers sorted by their Collatz stopping time,
OEIS [A127824](https://oeis.org/A127824):

~~~spl svg=D
let s = [1];
let t = 1:15.collect { :unused |
	let u = s.select { :x |
		x % 3 = 1 & {
			let y = (x - 1) / 3;
			y.isOdd & {
				y > 1
			}
		}
	} - 1 / 3;
	s := ((2 * s) ++ u).nub.sort;
	s
};
([1] ++ t.catenate).log.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-D.svg)

* * *

See also: isEven, isOdd, nestWhileList

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CollatzProblem.html)
[2](https://mathworld.wolfram.com/HailstoneNumber.html),
_OEIS_
[1](https://oeis.org/A070165)
[2](https://oeis.org/A008884)
[3](https://oeis.org/A006877)
[4](https://oeis.org/A006577)
[5](https://oeis.org/A127824),
_W_
[1](https://en.wikipedia.org/wiki/Collatz_conjecture)
