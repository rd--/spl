# zeckendorfRepresentation

- _zeckendorfRepresentation(n)_

Answer the Zeckendorf representation of the positive integer _n_.
Zeckendorf’s theorem states that every positive integer can be represented as the sum of distinct Fibonacci numbers,
using no two consecutive numbers,
and that such a representation is unique.
The Zeckendorf representation gives this unique set of indices as a binary string.

The first number whose representation takes three summands is twelve:

```
>>> 12.zeckendorfRepresentation
[1 0 1 0 1]
```

The first number whose representation takes four summands is thirty-three:

```
>>> 33.zeckendorfRepresentation
[1 0 1 0 1 0 1]
```

There are _F(k)_ Zeckendorf representations of length _k_.
The thirteen representations of length seven:

```
>>> 21:33.zeckendorfRepresentation
[
	1 0 0 0 0 0 0;
	1 0 0 0 0 0 1;
	1 0 0 0 0 1 0;
	1 0 0 0 1 0 0;
	1 0 0 0 1 0 1;
	1 0 0 1 0 0 0;
	1 0 0 1 0 0 1;
	1 0 0 1 0 1 0;
	1 0 1 0 0 0 0;
	1 0 1 0 0 0 1;
	1 0 1 0 0 1 0;
	1 0 1 0 1 0 0;
	1 0 1 0 1 0 1
]
```

The Zeckendorf representation of 1⏨:

```
>>> (10 ^ 10).zeckendorfRepresentation
[
	1 0 0 1 0 0 0 1 0 1 0 0 0 0 1 0 1 0 1 0
	1 0 0 0 1 0 0 0 0 1 0 1 0 0 1 0 0 0 0 1
	0 0 1 0 0 1 0 1
]
```

Reconstruct integer from Zeckendorf representation:

```
>>> let n = 10 ^ 10;
>>> let z = n.zeckendorfRepresentation;
>>> let i = z.reverse.indicesOf(1);
>>> (z.size, (i + 1).fibonacci.sum)
(48, 10 ^ 10)
```

First few terms,
OEIS [A014417](https://oeis.org/A014417):

```
>>> 0:20.collect(
>>> 	zeckendorfRepresentation:/1
>>> )
[
	          0;
	          1;
	        1 0;
	      1 0 0;
	      1 0 1;
	    1 0 0 0;
	    1 0 0 1;
	    1 0 1 0;
	  1 0 0 0 0;
	  1 0 0 0 1;
	  1 0 0 1 0;
	  1 0 1 0 0;
	  1 0 1 0 1;
	1 0 0 0 0 0;
	1 0 0 0 0 1;
	1 0 0 0 1 0;
	1 0 0 1 0 0;
	1 0 0 1 0 1;
	1 0 1 0 0 0;
	1 0 1 0 0 1;
	1 0 1 0 1 0
]
```

Verify the answers shown above:

```
>>> 0:20.collect { :n |
>>> 	let i = n.zeckendorfRepresentation;
>>> 	let k = i.size;
>>> 	let q = (2 .. k + 1).fibonacci;
>>> 	(q * i.reverse).sum
>>> }
[0 .. 20]
```

Summands for each entry,
OEIS [A035517](https://oeis.org/A035517):

```
>>> 0:10.collect { :n |
>>> 	let z = n.zeckendorfRepresentation;
>>> 	let i = z.reverse.indicesOf(1);
>>> 	(i + 1).fibonacciNumber
>>> }
[
	;
	1;
	2;
	3;
	1 3;
	5;
	1 5;
	2 5;
	8;
	1 8;
	2 8
]
```

Of a not very small integer:

```
>>> let n = 987654321;
>>> let i = n.zeckendorfRepresentation;
>>> let k = i.size;
>>> let q = (2 .. k + 1).fibonacci;
>>> (i, i.size, (q * i.reverse).sum)
(
	[
		1 0 1 0 0 0 0 0 1 0
		0 0 1 0 1 0 1 0 0 0
		1 0 1 0 1 0 0 1 0 0
		0 1 0 1 0 0 0 1 0 0
		1 0 1
	],
	43,
	987654321
)
```

Zeckendorf representation as binary integer,
OEIS [A003714](https://oeis.org/A003714):

```
>>> 0:33.collect { :n |
>>> 	n.zeckendorfRepresentation
>>> 	.fromDigits(2)
>>> }
[
	 0  1  2  4  5  8  9 10 16 17
	18 20 21 32 33 34 36 37 40 41
	42 64 65 66 68 69 72 73 74 80
	81 82 84 85
]
```

Zeckendorf-Niven numbers,
OEIS [A328208](https://oeis.org/A328208):

```
>>> 0:99.select { :n |
>>> 	let z = n.zeckendorfRepresentation;
>>> 	let m = z.occurrencesOf(1);
>>> 	n.divisible(m)
>>> }
[
	 1  2  3  4  5  6  8 10 12 13
	14 16 18 21 22 24 26 27 30 34
	36 42 45 48 55 56 58 60 66 68
	69 72 76 78 80 81 84 89 90 92
	93 94 96 99
]
```

The horizontal para-Fibonacci sequence,
OEIS [A035614](https://oeis.org/A035614):

```
>>> 0:80.collect { :n |
>>> 	let z = (n + 1).zeckendorfRepresentation;
>>> 	z.fromDigits.integerExponent(10)
>>> }
[
	0 1 2 0 3 0 1 4 0 1 2 0 5 0 1 2 0 3 0 1
	6 0 1 2 0 3 0 1 4 0 1 2 0 7 0 1 2 0 3 0
	1 4 0 1 2 0 5 0 1 2 0 3 0 1 8 0 1 2 0 3
	0 1 4 0 1 2 0 5 0 1 2 0 3 0 1 6 0 1 2 0
	3
]
```

Greatest Fibonacci number that does not exceed _n_,
OEIS [A087172](https://oeis.org/A087172):

```
>>> 1:18.collect { :n |
>>> 	let z = n.zeckendorfRepresentation;
>>> 	(z.size + 1).fibonacci
>>> }
[1 2 3 3 5 5 5 8 8 8 8 8 13 13 13 13 13 13]
```

Discrete plot of a representation with 115 places:

~~~spl svg=A
9E23.zeckendorfRepresentation
.discretePlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-A.svg)

Counts of above plot,
indicating the proportions of zeros and ones:

```
>>> 9E23.zeckendorfRepresentation
>>> .counts
[0 -> 85, 1 -> 30]
```

Number of ones (terms) in the Zeckendorf representation of _n_,
OEIS [A007895](https://oeis.org/A007895):

```
>>> 0:104.collect { :n |
>>> 	n.zeckendorfRepresentation
>>> 	.occurrencesOf(1)
>>> }
[
	0 1 1 1 2 1 2 2 1 2 2 2 3 1 2 2 2 3 2 3
	3 1 2 2 2 3 2 3 3 2 3 3 3 4 1 2 2 2 3 2
	3 3 2 3 3 3 4 2 3 3 3 4 3 4 4 1 2 2 2 3
	2 3 3 2 3 3 3 4 2 3 3 3 4 3 4 4 2 3 3 3
	4 3 4 4 3 4 4 4 5 1 2 2 2 3 2 3 3 2 3 3
	3 4 2 3 3
]
```

Plot first few terms:

~~~spl svg=B
0:125.collect { :n |
	n.zeckendorfRepresentation
	.occurrencesOf(1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-B.svg)

Plot first few terms of
OEIS [A003714](https://oeis.org/A003714):

~~~spl svg=C
0:75.collect { :n |
	n.zeckendorfRepresentation
	.fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-C.svg)

Plot summands for each entry,
OEIS [A035517](https://oeis.org/A035517):

~~~spl svg=D
0:50.collect { :n |
	let z = n.zeckendorfRepresentation;
	let i = z.reverse.indicesOf(1);
	(i + 1).fibonacci
}.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-D.svg)

Plot integers whose Zeckendorf representation is palindromic,
OEIS [A094202](https://oeis.org/A094202):

~~~spl svg=E
0:500.select { :n |
	n.zeckendorfRepresentation
	.isPalindrome
}.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-E.svg)

Plot the number of runs of identical bits in the binary Zeckendorf representation of _n_,
OEIS [A104324](https://oeis.org/A104324):

~~~spl svg=F
1:200.collect { :n |
	n.zeckendorfRepresentation
	.split(=)
	.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-F.svg)

Matrix plot of Zeckendorf representations of length seven:

~~~spl svg=G
21:33.zeckendorfRepresentation
.matrixPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-G.svg)

Number of zeroes in the Zeckendorf representation of _n_,
OEIS [A102364](https://oeis.org/A102364):

```
>>> 1:60.collect { :n |
>>> 	n.zeckendorfRepresentation
>>> 	.occurrencesOf(0)
>>> }
[
	0 1 2 1 3 2 2 4 3 3 3 2 5 4 4 4 3 4 3 3
	6 5 5 5 4 5 4 4 5 4 4 4 3 7 6 6 6 5 6 5
	5 6 5 5 5 4 6 5 5 5 4 5 4 4 8 7 7 7 6 7
]
```

Plot first few terms:

~~~spl svg=H
1:250.collect { :n |
 	n.zeckendorfRepresentation
	.occurrencesOf(0)
}.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-H.svg)

* * *

See also: dualZeckendorfRepresentation, fibonacci

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ZeckendorfRepresentation.html),
_OEIS_
[1](https://oeis.org/A014417)
[2](https://oeis.org/A007895)
[3](https://oeis.org/A003714)
[4](https://oeis.org/A328208)
[5](https://oeis.org/A035517)
[6](https://oeis.org/A094202)
[7](https://oeis.org/A104324)
[8](https://oeis.org/A035614)
[9](https://oeis.org/A087172)
[10](https://oeis.org/A102364),
_W_
[1](https://en.wikipedia.org/wiki/Zeckendorf%27s_theorem)

Categories: Converting
