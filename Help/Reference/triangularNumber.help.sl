# triangularNumber

- _triangularNumber(n)_

Answer the _n_-th triangular number.

```
>>> 23.triangularNumber
276
```

Relation to `binomial`:

```
>>> 23.triangularNumber
(23 + 1).binomial(2)
```

First few terms,
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

The reciprocals of triangular numbers produce is convergent series where the limit is two:

~~~spl svg=A
1:47.triangularNumber
.reciprocal
.prefixSum
.linePlot
~~~

![](sw/spl/Help/Image/triangularNumber-A.svg)

Inverse Moebius transform of triangular numbers,
OEIS [A007437](http://oeis.org/A007437):

~~~spl svg=B
1:100.collect { :n |
	let a = 1.divisorSigma(n);
	let b = 2.divisorSigma(n);
	(a + b) / 2
}.scatterPlot
~~~

![](sw/spl/Help/Image/triangularNumber-B.svg)

* * *

See also: binomial, cube, pascalTriangle, polygonalNumber, square, tetrahedralNumber

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
