# dualZeckendorfRepresentation

- _dualZeckendorfRepresentation(n)_

Answer the Dual Zeckendorf representation of the positive integer _n_.

The Zeckendorf representation of 1⏨:

```
>>> (10 ^ 10).dualZeckendorfRepresentation
[
	1 1 0 1 0 1 1 1 1 1 0 1 1 0 1 1 1 1 1 1
	1 0 1 1 1 0 1 1 0 1 1 1 1 0 1 0 1 1 0 1
	1 0 1 1 1 0 1
]
```

Reconstruct integer from Zeckendorf representation:

```
>>> let n = 10 ^ 10;
>>> let z = n.dualZeckendorfRepresentation;
>>> let i = z.reverse.indicesOf(1);
>>> (z.size, (i + 1).fibonacci.sum)
(47, 10 ^ 10)
```

First few terms,
OEIS [A104326](https://oeis.org/A104326):

```
>>> 0:33.collect(
>>> 	dualZeckendorfRepresentation:/1
>>> )
[
	0;
	1;
	1 0;
	1 1;
	1 0 1;
	1 1 0;
	1 1 1;
	1 0 1 0;
	1 0 1 1;
	1 1 0 1;
	1 1 1 0;
	1 1 1 1;
	1 0 1 0 1;
	1 0 1 1 0;
	1 0 1 1 1;
	1 1 0 1 0;
	1 1 0 1 1;
	1 1 1 0 1;
	1 1 1 1 0;
	1 1 1 1 1;
	1 0 1 0 1 0;
	1 0 1 0 1 1;
	1 0 1 1 0 1;
	1 0 1 1 1 0;
	1 0 1 1 1 1;
	1 1 0 1 0 1;
	1 1 0 1 1 0;
	1 1 0 1 1 1;
	1 1 1 0 1 0;
	1 1 1 0 1 1;
	1 1 1 1 0 1;
	1 1 1 1 1 0;
	1 1 1 1 1 1;
	1 0 1 0 1 0 1
]
```

Verify the answers shown above:

```
>>> 0:33.collect { :n |
>>> 	let i = n.dualZeckendorfRepresentation;
>>> 	let k = i.size;
>>> 	let q = (2 .. k + 1).fibonacci;
>>> 	(q * i.reverse).sum
>>> }
[0 .. 33]
```

Summands for each entry,
OEIS [A112309](https://oeis.org/A112309):

```
>>> 0:10.collect { :n |
>>> 	let z = n.dualZeckendorfRepresentation;
>>> 	let i = z.reverse.indicesOf(1);
>>> 	(i + 1).fibonacciNumber
>>> }
[
	;
	1;
	2;
	1 2;
	1 3;
	2 3;
	1 2 3;
	2 5;
	1 2 5;
	1 3 5;
	2 3 5
]
```

Of a not very small integer:

```
>>> let n = 987654321;
>>> let i = n.dualZeckendorfRepresentation;
>>> let k = i.size;
>>> let q = (2 .. k + 1).fibonacci;
>>> (i, i.size, (q * i.reverse).sum)
(
	[
		1 1 1 0 1 0 1 1 1 0
		1 1 1 1 1 1 1 0 1 1
		1 1 1 1 1 1 0 1 0 1
		1 1 1 1 0 1 1 1 1 1
		0 1
	],
	42,
	987654321
)
```

Number of terms in the Dual Zeckendorf representation of _n_,
OEIS [A112310](https://oeis.org/A112310):

```
>>> 0:104.collect { :n |
>>> 	n.dualZeckendorfRepresentation
>>> 	.occurrencesOf(1)
>>> }
[
	0 1 1 2 2 2 3 2 3 3 3 4 3 3 4 3 4 4 4 5
	3 4 4 4 5 4 4 5 4 5 5 5 6 4 4 5 4 5 5 5
	6 4 5 5 5 6 5 5 6 5 6 6 6 7 4 5 5 5 6 5
	5 6 5 6 6 6 7 5 5 6 5 6 6 6 7 5 6 6 6 7
	6 6 7 6 7 7 7 8 5 5 6 5 6 6 6 7 5 6 6 6
	7 6 6 7 6
]
```

Dual Zeckendorf representation as binary integer,
OEIS [A003754](https://oeis.org/A003754):

```
>>> 0:33.collect { :n |
>>> 	n.dualZeckendorfRepresentation
>>> 	.fromDigits(2)
>>> }
[
	 0  1  2  3  5  6  7 10 11 13
	14 15 21 22 23 26 27 29 30 31
	42 43 45 46 47 53 54 55 58 59
	61 62 63 85
]
```

Dual Zeckendorf-Niven numbers,
OEIS [A328212](https://oeis.org/A328212):

```
>>> 0:99.select { :n |
>>> 	let z = n.dualZeckendorfRepresentation;
>>> 	let m = z.occurrencesOf(1);
>>> 	n.divisible(m)
>>> }
[
	 1  2  4  6  9 12 15 16 28 30
	35 36 48 55 60 70 72 75 78 84
	90
]
```

Discrete plot of a representation with 114 places:

~~~spl svg=A
9E23.dualZeckendorfRepresentation
.discretePlot
~~~

![](sw/spl/Help/Image/dualZeckendorfRepresentation-A.svg)

Counts of above plot,
indicating the proportions of zeros and ones:

```
>>> 9E23.dualZeckendorfRepresentation
>>> .counts
[0 -> 33, 1 -> 81]
```

Plot first few terms of
OEIS [A112310](https://oeis.org/A112310):

~~~spl svg=B
0:125.collect { :n |
	n.dualZeckendorfRepresentation
	.occurrencesOf(1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/dualZeckendorfRepresentation-B.svg)

Plot first few terms of
OEIS [A003754](https://oeis.org/A003754):

~~~spl svg=C
0:75.collect { :n |
	n.dualZeckendorfRepresentation
	.fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/dualZeckendorfRepresentation-C.svg)

Plot summands for each entry,
OEIS [A112309](https://oeis.org/A112309):

~~~spl svg=D
0:50.collect { :n |
	let z = n.dualZeckendorfRepresentation;
	let i = z.reverse.indicesOf(1);
	(i + 1).fibonacci
}.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/dualZeckendorfRepresentation-D.svg)

Plot integers whose Dual Zeckendorf representation is palindromic,
OEIS [A331191](https://oeis.org/A331191):

~~~spl svg=E
0:500.select { :n |
	n.dualZeckendorfRepresentation
	.isPalindrome
}.scatterPlot
~~~

![](sw/spl/Help/Image/dualZeckendorfRepresentation-E.svg)

Plot the number of runs of identical bits in the Dual Zeckendorf representation of _n_,
OEIS [A104325](https://oeis.org/A104325):

~~~spl svg=F
1:200.collect { :n |
	n.dualZeckendorfRepresentation
	.split(=)
	.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/dualZeckendorfRepresentation-F.svg)

* * *

See also: fibonacci, zeckendorfRepresentation

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ZeckendorfsTheorem.html),
_OEIS_
[1](https://oeis.org/A104326)
[2](https://oeis.org/A112309)
[3](https://oeis.org/A112310)
[4](https://oeis.org/A003754)
[5](https://oeis.org/A331191)
[6](https://oeis.org/A104325),
_W_
[1](https://en.wikipedia.org/wiki/Zeckendorf%27s_theorem)

Categories: Converting
