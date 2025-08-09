# catalanTriangle

- _catalanTriangle(r)_
- _catalanTriangle(n, k)_

A Catalan triangle give the number of strings consisting of _n_ zeroes and _k_ ones,
such that no initial segment of the string has more ones than zeroes.
It is a generalization of the Catalan numbers.

The unary form answers the first _r_ rows:

```
>>> 8.catalanTriangle
[
	1;
	1 1;
	1 2 2;
	1 3 5 5;
	1 4 9 14 14;
	1 5 14 28 42 42;
	1 6 20 48 90 132 132;
	1 7 27 75 165 297 429 429;
	1 8 35 110 275 572 1001 1430 1430
]
```

The binary form answers the entry at position _n,k_:

```
>>> 0:8.collect { :n |
>>> 	0:n.collect { :k |
>>> 		n.catalanTriangle(k)
>>> 	}
>>> }
[
	1;
	1 1;
	1 2 2;
	1 3 5 5;
	1 4 9 14 14;
	1 5 14 28 42 42;
	1 6 20 48 90 132 132;
	1 7 27 75 165 297 429 429;
	1 8 35 110 275 572 1001 1430 1430
]
```

* * *

See also: catalanNumber, finesSequence

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CatalansTriangle.html),
_OEIS_
[1](https://oeis.org/A009766),
_W_
[1](https://en.wikipedia.org/wiki/Catalan%27s_triangle)
