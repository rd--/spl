# triangularArray

- triangularArray(m:n, f:/2, k=0)_

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

* * *


_OEIS_
[1](https://oeis.org/A007318),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_array)
[2](https://en.wikipedia.org/wiki/Floyd%27s_triangle)
