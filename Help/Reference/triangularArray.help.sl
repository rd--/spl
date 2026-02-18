# triangularArray

- _triangularArray(m:n, f:/2, k=0)_

Answer a triangular array of _m:n_ rows,
where the _i_-th row has _i+k_ columns,
and each cell is given by _f(i,j)_.

Pascal’s triangle,
OEIS [A007318](https://oeis.org/A007318):

```
>>> 0:7.triangularArray(binomial:/2)
[
	1;
	1 1;
	1 2 1;
	1 3 3 1;
	1 4 6 4 1;
	1 5 10 10 5 1;
	1 6 15 20 15 6 1;
	1 7 21 35 35 21 7 1
]
```

A triangle in which the _n_-th row gives the _n_ smallest powers of _n_,
OEIS [A075363](https://oeis.org/A075363):

```
>>> 1:7.triangularArray(^)
[
	1;
	2 4;
	3 9 27;
	4 16 64 256;
	5 25 125 625 3125;
	6 36 216 1296 7776 46656;
	7 49 343 2401 16807 117649 823543
]

>>> 1:7.collect { :n |
>>> 	n ^ 1:n
>>> }
[
	1;
	2 4;
	3 9 27;
	4 16 64 256;
	5 25 125 625 3125;
	6 36 216 1296 7776 46656;
	7 49 343 2401 16807 117649 823543
]
```

The geometric mean of each row,
OEIS [A075364](https://oeis.org/A075364):

```
>>> 1:9.triangularArray(^)
>>> .collect(geometricMean:/1)
>>> .floor(1E-9)
[1 2 9 32 125 529 2401 11585 59049]

>>> 1:9.collect { :n |
>>> 	(n ^ ((n + 1) / 2)).floor
>>> }
[1 2 9 32 125 529 2401 11585 59049]
```

Triangle of permutation coefficients,
OEIS [A094587](https://oeis.org/A094587):

```
>>> 0:7.triangularArray { :n :k |
>>> 	n.! / k.!
>>> }
[
	1;
	1 1;
	2 2 1;
	6 6 3 1;
	24 24 12 4 1;
	120 120 60 20 5 1;
	720 720 360 120 30 6 1;
	5040 5040 2520 840 210 42 7 1
]
```

Floyd’s triangle:

```
>>> 1:7.triangularArray { :n :k |
>>> 	3.polygonalNumber(n - 1) + k
>>> }
[
	1;
	2 3;
	4 5 6;
	7 8 9 10;
	11 12 13 14 15;
	16 17 18 19 20 21;
	22 23 24 25 26 27 28
]
```

Partial sums of Sierpinski’s gasket terms,
OEIS [A166556](https://oeis.org/A166556):

```
>>> (0 .. 13).triangularArray { :n :k |
>>> 	(k .. n).sum { :j |
>>> 		binomial(j, k) % 2
>>> 	}
>>> }
[
	 1;
	 2 1;
	 3 1 1;
	 4 2 2 1;
	 5 2 2 1 1;
	 6 3 2 1 2 1;
	 7 3 3 1 3 1 1;
	 8 4 4 2 4 2 2 1;
	 9 4 4 2 4 2 2 1 1;
	10 5 4 2 4 2 2 1 2 1;
	11 5 5 2 4 2 2 1 3 1 1;
	12 6 6 3 4 2 2 1 4 2 2 1;
	13 6 6 3 5 2 2 1 5 2 2 1 1;
	14 7 6 3 6 3 2 1 6 3 2 1 2 1
]
```

The rascal triangle,
OEIS [A077028](https://oeis.org/A077028):

```
>>> (0 .. 12).triangularArray { :n :k |
>>> 	k * (n - k) + 1
>>> }
[
	1;
	1 1;
	1 2 1;
	1 3 3 1;
	1 4 5 4 1;
	1 5 7 7 5 1;
	1 6 9 10 9 6 1;
	1 7 11 13 13 11 7 1;
	1 8 13 16 17 16 13 8 1;
	1 9 15 19 21 21 19 15 9 1;
	1 10 17 22 25 26 25 22 17 10 1;
	1 11 19 25 29 31 31 29 25 19 11 1;
	1 12 21 28 33 36 37 36 33 28 21 12 1
]
```

Clark’s triangle with _f=6_,
OEIS [A046902](https://oeis.org/A046902):

```
>>> let f = 6;
>>> 0:8.triangularArray { :n :k |
>>> 	let a = binomial(n, k - 1);
>>> 	let b = binomial(n - 1, k);
>>> 	(6 * a) + b
>>> }.replaceNaN(0)
[
	0;
	1  6;
	1  7 12;
	1  8 19  18;
	1  9 27  37  24;
	1 10 36  64  61  30;
	1 11 46 100 125  91  36;
	1 12 57 146 225 216 127  42;
	1 13 69 203 371 441 343 169  48
]
```

Clark’s triangle with _f=6_,
reversed rows,
OEIS [A090850](https://oeis.org/A090850):

```
>>> let f = 6;
>>> 0:9.triangularArray { :n :k |
>>> 	let a = binomial(n, k + 1);
>>> 	let b = binomial(n - 1, k - 1);
>>> 	(f * a) + b
>>> }.replaceNaN(0)
[
	0;
	6 1;
	12 7 1;
	18 19 8 1;
	24 37 27 9 1;
	30 61 64 36 10 1;
	36 91 125 100 46 11 1;
	42 127 216 225 146 57 12 1;
	48 169 343 441 371 203 69 13 1;
	54 217 512 784 812 574 272 82 14 1
]
```

Robbins triangle,
OEIS [A048601](https://oeis.org/A048601):

```
>>> 1L:8.triangularArray { :n :k |
>>> 	binomial(n + k - 2, k - 1)
>>> 	*
>>> 	((2 * n - k - 1).! \ (n - k ).!)
>>> 	*
>>> 	0.to(n - 2).product { :j |
>>> 		(3 * j + 1).! \ (n + j).!
>>> 	}
>>> }
[
	1;
	1 1;
	2 3 2;
	7 14 14 7;
	42 105 135 105 42;
	429 1287 2002 2002 1287 429
	;
	7436 26026 47320
	56784
	47320 26026 7436
	;
	218348 873392 1813968 2519400
	2519400 1813968 873392 218348
]
```

Start counting again and again,
OEIS [A002260](https://oeis.org/A002260)
and [A004736](https://oeis.org/A004736):

```
>>> 1:7.triangularArray { :i :j |
>>> 	j
>>> }
[
	1;
	1 2;
	1 2 3;
	1 2 3 4;
	1 2 3 4 5;
	1 2 3 4 5 6;
	1 2 3 4 5 6 7
]

>>> 1:7.triangularArray { :i :j |
>>> 	i - j + 1
>>> }
[
	1;
	2 1;
	3 2 1;
	4 3 2 1;
	5 4 3 2 1;
	6 5 4 3 2 1;
	7 6 5 4 3 2 1
]
```

The greatest common divisor matrix read by antidiagonals,
OEIS [A003989](https://oeis.org/A003989):

```
>>> 1:11.triangularArray { :x :y |
>>> 	gcd(x - y + 1, y)
>>> }
[
	1;
	1 1;
	1 2 1;
	1 1 1 1;
	1 2 3 2 1;
	1 1 1 1 1 1;
	1 2 1 4 1 2 1;
	1 1 3 1 1 3 1 1;
	1 2 1 2 5 2 1 2 1;
	1 1 1 1 1 1 1 1 1 1;
	1 2 3 4 1 6 1 4 3 2 1
]
```

_2^(n-k+1)*(k+1)-(n+2)_,
OEIS [A213568](https://oeis.org/A213568):

```
>>> 1:7.triangularArray { :n :k |
>>> 	2 ^ (n - k + 1) * (k + 1) - (n + 2)
>>> }
[
	1;
	4 2;
	11 7 3;
	26 18 10 4;
	57 41 25 13 5;
	120 88 56 32 16 6;
	247 183 119 71 39 19 7
]
```

`binomial` of _n+k-1_ and _k_,
OEIS [A059481](https://oeis.org/A059481):

```
>>> 0:7.triangularArray { :n :k |
>>> 	binomial(n + k - 1, k)
>>> }.allButFirst
[
	1 1;
	1 2 3;
	1 3 6 10;
	1 4 10 20 35;
	1 5 15 35 70 126;
	1 6 21 56 126 252 462;
	1 7 28 84 210 462 924 1716
]
```

Plot the triangle given by recursion _T(n,k)=T(n-1,k)-T(n,k-1)_,
OEIS [A096470](https://oeis.org/A096470):

~~~spl svg=A
let f = { :n :k |
	(k = 0 | { n = k }).if {
		1
	} {
		(n < 0 | { k < 0 }).if {
			0
		} {
			(n > k).if {
				f(n - 1, k) - f(n, k - 1)
			} {
				0
			}
		}
	}
};
0:10.triangularArray(f:/2)
.catenate
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-A.svg)

Plot multiplication table read by antidiagonals,
OEIS [A003991](https://oeis.org/A003991):

~~~spl svg=B
0:13.triangularArray { :x :y |
	(x + 1 - y) * y
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-B.svg)

Plot the greatest common divisor matrix read by antidiagonals,
OEIS [A003989](https://oeis.org/A003989):

~~~spl svg=C
1:25.triangularArray { :x :y |
	gcd(x - y + 1, y) - 1
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/triangularArray-C.svg)

Number of partitions of _n_ into _k_ distinct parts,
OEIS [A060016](https://oeis.org/A060016):

~~~spl svg=D
let t = { :n :k |
	(k = 1).if {
		1
	} {
		(k < n).if {
			t(n - k, k) + t(n - k, k - 1)
		} {
			0
		}
	}
};
1:30.triangularArray(t:/2)
.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-D.svg)

Array where differences in rows are _n…1_,
OEIS [A141419](https://oeis.org/A141419):

~~~spl svg=E
1:13.triangularArray { :n :m |
	m * ((2 * n) - m + 1) / 2
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-E.svg)

Square-pyramid-tree numbers,
OEIS [A051678](https://oeis.org/A051678):

~~~spl svg=F
1:9.triangularArray { :n :m |
	let a = (n ^ 2) * (n ^ 2 - 1) / 12;
	let b = m * (m + 1) * (2 * m + 1) / 6;
	a + b
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-F.svg)

Plot number of hill-free Dyck paths of length _2n_ having height of first peak equal to _k_,
OEIS [A065602](https://oeis.org/A065602):

~~~spl svg=G
2:12.triangularArray { :n :k |
	let m = (n - k) / 2;
	0:m.sum { :j |
		let a = (k - 1 + (2 * j));
		let b = binomial(
			(2 * n) - k - 1 - (2 * j),
			n - 1
		);
		let c = ((2 * n) - k - 1 - (2 * j));
		a * b / c
	}
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/triangularArray-G.svg)

Plot _k_,
OEIS [A002262](https://oeis.org/A002262):

~~~spl svg=H
0:9.triangularArray { :n :k |
	k
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/triangularArray-H.svg)

Plot _n-k_,
OEIS [A025581](https://oeis.org/A025581):

~~~spl svg=I
0:9.triangularArray(-).catenate.stepPlot
~~~

![](sw/spl/Help/Image/triangularArray-I.svg)

Count number of restricted knight’s walks,
OEIS [A049581](https://oeis.org/A049581):

~~~spl svg=J
let t = { :n :k |
	(n < 2 | { k < 2 }).if {
		1
	} {
		t(n + 1, k - 2) + t(n - 2, k + 1)
	}
};
0:11.triangularArray { :s :n |
	t(n, s - n)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/triangularArray-J.svg)

* * *

See also: antidiagonalArray, array, collect, isTriangularArray, table

Guides: Array Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NumberTriangle.html),
_OEIS_
[1](https://oeis.org/A007318)
[2](https://oeis.org/A075363)
[3](https://oeis.org/A075364)
[4](https://oeis.org/A094587)
[5](https://oeis.org/A166556)
[6](https://oeis.org/A077028)
[7](https://oeis.org/A048601)
[8](https://oeis.org/A002260)
[9](https://oeis.org/A004736)
[10](https://oeis.org/A096470)
[11](https://oeis.org/A003991)
[12](https://oeis.org/A003989)
[13](https://oeis.org/A060016)
[14](https://oeis.org/A141419),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_array)
[2](https://en.wikipedia.org/wiki/Floyd%27s_triangle)
