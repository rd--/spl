# antidiagonalArray

- _antidiagonalArray(n:m, f/2)_

Answer rows _n:m_ of the triangular array given by the falling anti-diagonals of the matrix function _f_.

Constant _n_ and _k_:

```
>>> { :n :k | n }.table(1:4, 1:4)
[
	1 1 1 1;
	2 2 2 2;
	3 3 3 3;
	4 4 4 4
]

>>> 1:4.antidiagonalArray { :n :k | n }
[
	1;
	1 2;
	1 2 3;
	1 2 3 4
]

>>> { :n :k | k }.table(1:4, 1:4)
[
	1 2 3 4;
	1 2 3 4;
	1 2 3 4;
	1 2 3 4
]

>>> 1:4.antidiagonalArray { :n :k | k }
[
	1;
	2 1;
	3 2 1;
	4 3 2 1
]
```

Wythoff array in (falling) antidiagonals:

```
>>> 1:8.antidiagonalArray(
>>> 	wythoffArray/2
>>> )
[
	1;
	2 4;
	3 7 6;
	5 11 10 9;
	8 18 16 15 12;
	13 29 26 24 20 14;
	21 47 42 39 32 23 17;
	34 76 68 63 52 37 28 19
]
```

Indices:

```
>>> 1:6.antidiagonalArray { :i :j |
>>> 	[i, j]
>>> }
[
	1 1:;
	1 2; 2 1:;
	1 3; 2 2; 3 1:;
	1 4; 2 3; 3 2; 4 1:;
	1 5; 2 4; 3 3; 4 2; 5 1:;
	1 6; 2 5; 3 4; 4 3; 5 2; 6 1
]

>>> 0:3.antidiagonalArray { :i :j |
>>> 	[i, j]
>>> }
[
	0 0:;
	0 1; 1 0:;
	0 2; 1 1; 2 0:;
	0 3; 1 2; 2 1; 3 0
]
```

Count restricted growth strings of a particular kind,
OEIS [A306024](https://oeis.org/A306024):

```
>>> let b = { :n :k :m |
>>> 	(n = 0).if {
>>> 		1
>>> 	} {
>>> 		(1 .. m + k).sum { :j |
>>> 			b(n - 1, k, max(m, j))
>>> 		}
>>> 	}
>>> };
>>> 0:7.antidiagonalArray { :n :k |
>>> 	b(n, k, 0)
>>> }
[
	1;
	1 0;
	1 1 0;
	1 2 2 0;
	1 3 7 5 0;
	1 4 15 31 15 0;
	1 5 26 95 164 52 0;
	1 6 40 214 717 999 203 0
]
```

Running sum of Pascal’s triangle,
OEIS [A074909](https://oeis.org/A074909):

```
>>> 0:9.antidiagonalArray { :n :k |
>>> 	binomial(n + k + 1, n)
>>> }
[
	1;
	1 2;
	1 3 3;
	1 4 6 4;
	1 5 10 10 5;
	1 6 15 20 15 6;
	1 7 21 35 35 21 7;
	1 8 28 56 70 56 28 8;
	1 9 36 84 126 126 84 36 9;
	1 10 45 120 210 252 210 120 45 10
]
```

Table _n-k_,
read by upwards antidiagonals,
OEIS [A114327](https://oeis.org/A114327):

~~~spl svg=A oeis=A114327
1:11.antidiagonalArray(-.swap)
.catenate
.discretePlot
~~~

![](Help/Image/antidiagonalArray-A.svg)

Table _|n-k|_,
read by upwards antidiagonals,
OEIS [A049581](https://oeis.org/A049581):

~~~spl svg=B oeis=A049581
1:9.antidiagonalArray { :n :k |
	(n - k).abs
}.catenate.discretePlot
~~~

![](Help/Image/antidiagonalArray-B.svg)

The multiplication table,
read by antidiagonals,
OEIS [A004247](https://oeis.org/A004247):

~~~spl svg=C oeis=A004247
0:13.antidiagonalArray(*)
.catenate.scatterPlot
~~~

![](Help/Image/antidiagonalArray-C.svg)

Square array,
read by antidiagonals,
based on triangular numbers with each term being the sum of two consecutive terms in the previous row,
OEIS [A058395](https://oeis.org/A058395):

~~~spl svg=D oeis=A058395
let t = { :n :k |
	(n = 0).if {
		k.isOdd.if {
			0
		} {
			(k + 2) * (k + 4) / 8
		}
	} {
		(k = 0).if {
			1
		} {
			t(n - 1, k - 1) + t(n - 1, k)
		}
	}
};
0:10.antidiagonalArray(t/2)
.catenate.discretePlot.logScale
~~~

![](Help/Image/antidiagonalArray-D.svg)

Array read by antidiagonals upwards,
_T(n,k-1)-(n+k-1)_ if positive and not already in row _n_ else sum,
OEIS [A066201](https://oeis.org/A066201):

~~~spl svg=E oeis=A066201
let t/2 = { :n :k |
	(k = 0).if {
		1
	} {
		let a = t(n, k - 1);
		let b = n + k - 1;
		let c = a - b;
		(
			c > 0 & {
				let l = k - 1;
				0:l.noneSatisfy { :j |
					t(n, j) = c
				}
			}
		).if {
			c
		} {
			a + b
		}
	}
}.memoize(true);
0:13.antidiagonalArray(t/2)
.collect(reverse/1)
.catenate
.scatterPlot
~~~

![](Help/Image/antidiagonalArray-E.svg)

* * *

See also: antidiagonal, antidiagonalIndicesDo, antidiagonalMatrix, triangularArray

Guides: Array Functions, Matrix Functions
