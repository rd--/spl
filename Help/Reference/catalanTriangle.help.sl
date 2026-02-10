# catalanTriangle

- _catalanTriangle(r)_
- _catalanTriangle(n, k)_

A Catalan triangle give the number of strings consisting of _n_ zeroes and _k_ ones,
such that no initial segment of the string has more ones than zeroes.
It is a generalisation of the Catalan numbers.

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
>>> 0:8.triangularArray { :n :k |
>>> 	n.catalanTriangle(k)
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

First few terms of fifth column,
OEIS [A000096](https://oeis.org/A000096):

```
>>> { :n | n * (n + 3 ) / 2 }.map(1:14)
[2 5 9 14 20 27 35 44 54 65 77 90 104 119]
```

First few terms of fourth column,
OEIS [A005586](https://oeis.org/A005586):

```
>>> { :n |
>>> 	n * (n + 4) * (n + 5) / 6
>>> }.map(1:10)
[5 14 28 48 75 110 154 208 273 350]
```

First few terms of fifth column,
OEIS [A005587](https://oeis.org/A005587):

```
>>> { :n |
>>> 	n * (n + 5) * (n + 6) * (n + 7)
>>> 	/ 24
>>> }.map(1:10)
[14 42 90 165 275 429 637 910 1260 1700]
```

* * *

See also: catalanNumber, finesSequence, fussCatalanNumber

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CatalansTriangle.html),
_OEIS_
[1](https://oeis.org/A009766)
[2](https://oeis.org/A000096)
[3](https://oeis.org/A005586),
[3](https://oeis.org/A005587),
_W_
[1](https://en.wikipedia.org/wiki/Catalan%27s_triangle)
