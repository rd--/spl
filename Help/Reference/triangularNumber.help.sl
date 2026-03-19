# triangularNumber

- _triangularNumber(n)_

Answer the _n_-th triangular number.

```
>>> 23.triangularNumber
276

>>> 276.inverseTriangularNumber
23
```

Relation to `binomial`:

```
>>> 23.triangularNumber
(23 + 1).binomial(2)
```

First few triangular numbers,
threads over lists,
OEIS [A000217](https://oeis.org/A000217):

```
>>> 0:23.triangularNumber
[
	  0   1   3   6  10  15  21  28
	 36  45  55  66  78  91 105 120
	136 153 171 190 210 231 253 276
]
```

The inverse of the triangular numbers,
implemented as `inverseTriangularNumber`,
OEIS [A003056](https://oeis.org/A003056):

```
>>> let inverse = { :n |
>>> 	(((1 + (8 * n)).sqrt - 1) / 2).floor
>>> };
>>> let a = 0:27;
>>> let b = a.triangularNumber;
>>> let c = a.collect(inverse:/1);
>>> let d = b.collect(inverse:/1);
>>> (c, d)
(
	[
		0 1 1 2 2 2 3 3 3 3
		4 4 4 4 4 5 5 5 5 5
		5 6 6 6 6 6 6 6
	],
	[0 .. 27]
)
```

The _n_-th partial sum of the natural integer series is the _n_-th triangular number:

```
>>> 1:23.sum
23.triangularNumber
```

Calculate arithmetic series starting at `zero`:

```
>>> let r = (0, 3 .. 21);
>>> r.sum
(r.size - 1).triangularNumber * r.step
```

Calculate the first _n_ rows and _m_ columns of the infinite matrix counted by antidiagonals:

```
>>> let n = 7;
>>> let m = 8;
>>> 1:n.collect { :i |
>>> 	let a = i.triangularNumber;
>>> 	1:m.collect { :j |
>>> 		let b = Range(i, i + j - 2, 1);
>>> 		a + b.sum
>>> 	}
>>> }
[
	 1  2  4  7 11 16 22 29;
	 3  5  8 12 17 23 30 38;
	 6  9 13 18 24 31 39 48;
	10 14 19 25 32 40 49 59;
	15 20 26 33 41 50 60 71;
	21 27 34 42 51 61 72 84;
	28 35 43 52 62 73 85 98
]
```

Distinct partitions of triangular numbers,
OEIS [A104382](https://oeis.org/A104382)

```
>>> 1:9.collect { :n |
>>> 	let m = n.triangularNumber;
>>> 	1:n.collect { :k |
>>> 		m.partitionFunctionQ(k)
>>> 	}
>>> }
[
	1;
	1 1;
	1 2 1;
	1 4 4 1;
	1 7 12 6 1;
	1 10 27 27 10 1;
	1 13 52 84 57 14 1;
	1 17 91 206 221 110 21 1;
	1 22 147 441 674 532 201 29 1
]
```

C.f. `polygonalNumber`:

```
>>> 1:23.triangularNumber
3.polygonalNumber(1:23)
```

Triangular numbers squared,
OEIS [A000537](https://oeis.org/A000537):

```
>>> 0:9.triangularNumber.square
[0 1 9 36 100 225 441 784 1296 2025]

>>> (0:9 ^ 3).prefixSum
[0 1 9 36 100 225 441 784 1296 2025]
```

Six times the triangular numbers,
OEIS [A028896](https://oeis.org/A028896):

```
>>> 0:9.triangularNumber * 6
[0 6 18 36 60 90 126 168 216 270]
```

Partial sums of six times the triangular numbers,
OEIS [A007531](https://oeis.org/A007531):

```
>>> (0:9.triangularNumber * 6).prefixSum
[0 6 24 60 120 210 336 504 720 990]
```

Triangular numbers of form _x(x+1)(x+2)_,
OEIS [A097571](https://oeis.org/A097571)
and
OEIS [A001219](https://oeis.org/A001219):

```
>>> [0 3 15 20 44 608 22736]
>>> .triangularNumber
[0 6 120 210 990 185136 258474216]
```

The reciprocals of triangular numbers produce a convergent series where the limit is two:

~~~spl svg=A
1:47.triangularNumber
.reciprocal
.prefixSum
.linePlot
~~~

![](Help/Image/triangularNumber-A.svg)

Inverse Moebius transform of triangular numbers,
OEIS [A007437](http://oeis.org/A007437):

~~~spl svg=B oeis=A007437
1:100.collect { :n |
	let a = 1.divisorSigma(n);
	let b = 2.divisorSigma(n);
	(a + b) / 2
}.scatterPlot
~~~

![](Help/Image/triangularNumber-B.svg)

The inverse of the triangular numbers,
OEIS [A003056](https://oeis.org/A003056):

~~~spl svg=C oeis=A003056
1:85.inverseTriangularNumber.discretePlot
~~~

![](Help/Image/triangularNumber-C.svg)

Triangular numbers repeated,
OEIS [A008805](https://oeis.org/A008805):

~~~spl svg=D oeis=A008805
(2 # 1:35.triangularNumber)
.discretePlot
~~~

![](Help/Image/triangularNumber-D.svg)

Triangular numbers,
OEIS [A000217](https://oeis.org/A000217):

~~~spl svg=E oeis=A000217
1:65.triangularNumber.discretePlot
~~~

![](Help/Image/triangularNumber-E.svg)

* * *

See also: binomial, cube, inverseTriangularNumber, pascalTriangle, polygonalNumber, square, tetrahedralNumber

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TriangularNumber.html),
_OEIS_
[1](https://oeis.org/A000217)
[2](https://oeis.org/A008302)
[3](https://oeis.org/A104382),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_number)
