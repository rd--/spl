# antidiagonal

- _antidiagonal(aMatrix, anInteger)_
- _antidiagonal(alpha)_ ⟹ _antidiagonal(alpha, 0)_

Answer the list of elements on the antidiagonal,
or on the _anInteger-th_ antidiagonal,
of _aMatrix_.
`antidiagonal` works even if _aMatrix_ is not a square matrix.

The antidiagonal runs from the top right corner to the bottom left corner:

```
>>> let m = [3 3].iota;
>>> (m, m.antidiagonal)
(
	[
		1 2 3;
		4 5 6;
		7 8 9
	],
	[3 5 7]
)
```

Antidiagonal of real matrix:

```
>>> [
>>> 	1.1 12.2  3.23;
>>> 	2.3 42.2 35.3;
>>> 	1.2  3.1  2.3
>>> ].antidiagonal
[3.23 42.2 1.2]
```

Antidiagonal of integer matrix:

```
>>> [
>>> 	2 3 1;
>>> 	2 2 1;
>>> 	3 1 2
>>> ].antidiagonal
[1 2 3]
```

Obtain the super-antidiagonal:

```
>>> let m = [3 3].iota;
>>> (m, m.antidiagonal(1))
(
	[
		1 2 3;
		4 5 6;
		7 8 9
	],
	[2 4]
)

>>> [1J1 2 3J-2; 0 4.pi 0J5; 1.e 0 6]
>>> .antidiagonal(1)
[2 0]
```

Obtain the sub-antidiagonal:

```
>>> [3 3].iota.antidiagonal(-1)
[6 8]
```

The antidiagonal of a non-square matrix:

```
>>> [3 4].iota.antidiagonal
[3 6 9]

>>> [3 2 2; 2 3 -2; 4 2 1; 3 7 9].antidiagonal
[2 3 4]
```

_antidiagonal(m, k)_ for an _n × n_ matrix gives non-empty results for _1 - n <= k <= n - 1_:

```
>>> let m = [4 4].fill { :index |
>>> 	index[2] - index[1]
>>> };
>>> (
>>> 	m,
>>> 	-3:3.collect { :k |
>>> 		m.antidiagonal(k)
>>> 	}
>>> )
(
	[
		 0  1  2  3;
		-1  0  1  2;
		-2 -1  0  1;
		-3 -2 -1  0
	],
	[
		0;
		1 -1;
		2  0 -2;
		3  1 -1 -3;
		2  0 -2;
		1 -1;
		0
	]
)

>>> let m = 3.iota(0, 1).reshape([4 4]);
>>> 3:-1:-3.collect { :i |
>>> 	m.antidiagonal(i)
>>> }
[0; 1 1; 2 2 2; 0 0 0 0; 1 1 1; 2 2; 0]
```

* * *

See also: diagonal, trace

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/slashdot),
_W_
[1](https://en.wikipedia.org/wiki/Main_diagonal#Antidiagonal)

Categories: Math, Matrix
