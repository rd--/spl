# kroneckerDelta

- _kroneckerDelta(n)_
- _kroneckerDelta(n₁, n₂)_
- _kroneckerDelta([n₁ n₂ …])_

Answer the Kronecker delta, equal to `one` if the numbers all are equal, and `zero` otherwise.

Evaluate numerically:

```
>>> 1.kroneckerDelta
0

>>> 0.kroneckerDelta
1

>>> 1.kroneckerDelta(0)
0

>>> -3.kroneckerDelta(-3)
1

>>> 2.5.kroneckerDelta(3.5)
0
```

At `List`:

```
>>> [0 1].kroneckerDelta
0

>>> [-3 -3].kroneckerDelta
1

>>> [2.5 3.5].kroneckerDelta
0
```

Complex number inputs:

```
>>> 2J-1.kroneckerDelta(2J-1)
1
```

Construct an identity matrix:

```
>>> { :x :y |
>>> 	x.kroneckerDelta(y)
>>> }.table(1:3, 1:3)
[
	1 0 0;
	0 1 0;
	0 0 1
]
```

Generate a banded matrix with two superdiagonals:

```
>>> { :i :j |
>>> 	let p = (i - j + 1).kroneckerDelta(0);
>>> 	let q = (i - j + 2).kroneckerDelta(0);
>>> 	(p + q) * i * (j ^ 2)
>>> }.table(1:5, 1:5)
[
	0   4   9   0   0;
	0   0  18  32   0;
	0   0   0  48  75;
	0   0   0   0 100;
	0   0   0   0   0
]
```

Plot over a subset of the integers:

~~~spl svg=A
(-2 .. 2).collect { :each |
	each.kroneckerDelta
}.discretePlot
~~~

![](sw/spl/Help/Image/kroneckerDelta-A.svg)

Pick out elements:

~~~spl png=B
{ :n :m |
	kroneckerDelta(n, m.eulerPhi + 1)
}.table(1:60, 1:60).Bitmap
~~~

![](sw/spl/Help/Image/kroneckerDelta-B.png)

* * *

See also: =, boole, identityMatrix, if, unitVector

Guides: Signal Processing Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KroneckerDelta.html)
[2](https://reference.wolfram.com/language/ref/KroneckerDelta.html),
_W_
[1](https://en.wikipedia.org/wiki/Kronecker_delta)
