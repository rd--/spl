# triangularArray

- _triangularArray(m:n, f:/2, k=0)_

Answer a triangular array of _m:n_ rows,
where the _i_-th row has _n+k_ columns,
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
>>> 	(n - 1).polygonalNumber + k
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

* * *

See also: array, collect, table

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
[7](https://oeis.org/A048601),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_array)
[2](https://en.wikipedia.org/wiki/Floyd%27s_triangle)
