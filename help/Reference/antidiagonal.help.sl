# antidiagonal

- _antidiagonal(aMatrix, anInteger)_
- _antidiagonal(alpha)_ => _antidiagonal(alpha, 0)_

Answer the list of elements on the antidiagonal,
or on the _anInteger-th_ antidiagonal,
of _aMatrix_.
Diagonal works even if _aMatrix_ is not a square matrix.

```
>>> [3 3].iota.antidiagonal
[7 5 3]

>>> [
>>> 	1.1 12.2  3.23;
>>> 	2.3 42.2 35.3;
>>> 	1.2  3.1  2.3
>>> ].antidiagonal
[1.2 42.2 3.23]

>>> [2 3 1; 2 2 1; 3 1 2].antidiagonal
[3 2 1]
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
	[4 2]
)

>>> [1j1 2 3j-2; 0 4.pi 0j5; e 0 6].antidiagonal(1)
[0 2]
```

Obtain the sub-antidiagonal:

```
>>> [3 3].iota.antidiagonal(-1)
[8 6]
```

The antidiagonal of a non-square matrix:

```
>>> [3 4].iota.antidiagonal
[9 6 3]

>>> [3 2 2; 2 3 -2; 4 2 1; 3 7 9].antidiagonal
[4 3 2]
```

_antidiagonal(m, k)_ for an _n × n_ matrix gives non-empty results for _1 - n <= k <= n - 1_:

```
>>> [4 4].fill { :index | index[2] - index[1] }
[0 1 2 3; -1 0 1 2; -2 -1 0 1; -3 -2 -1 0]

>>> let m = [4 4].fill { :index | index[2] - index[1] };
>>> -3:3.collect { :k | m.antidiagonal(k) }
[0; -1 1; -2 0 2; -3 -1 1 3; -2 0 2; -1 1; 0]
```

* * *

See also: diagonal, trace

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Diagonal.html)
