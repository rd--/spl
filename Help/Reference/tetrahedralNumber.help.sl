# tetrahedralNumber

- _tetrahedralNumber(n)_

Answer the _n_-th tetrahedral number,
also called the triangular pyramidal number.

Tetrahedral numbers,
threads over lists,
OEIS [A000292](https://oeis.org/A000292):

```
>>> 0:22.tetrahedralNumber
[
	   0    1    4   10   20
	  35   56   84  120  165
	 220  286  364  455  560
	 680  816  969 1140 1330
	1540 1771 2024
]
```

Linear recurrence:

```
>>> [4 -6 4 -1].linearRecurrence(
>>> 	[0 1 4 10], 10
>>> )
[0 1 4 10 20 35 56 84 120 165]
```

Relation to `pyramidalNumber`:

```
>>> 3.pyramidalNumber(0:9)
[0 1 4 10 20 35 56 84 120 165]
```

Relation to `prefixSum`:

```
>>> 0:9.prefixSum.prefixSum
[0 1 4 10 20 35 56 84 120 165]
```

Relation to `binomial`:

```
>>> (0:9 + 2).binomial(3)
[0 1 4 10 20 35 56 84 120 165]
```

Relation to `dot`:

```
>>> 1:9.collect { :n |
>>> 	let a = [1 .. n];
>>> 	a.dot(a.reverse)
>>> }
[1 4 10 20 35 56 84 120 165]
```

Relation to `triangularNumber`:

```
>>> 0:14.tetrahedralNumber.differences
[1 3 6 10 15 21 28 36 45 55 66 78 91 105]

1:14.triangularNumber
[1 3 6 10 15 21 28 36 45 55 66 78 91 105]
```

Relation to `convolve`:

```
>>> [1 .. 9].convolve([1 .. 9]).first(9)
[1 4 10 20 35 56 84 120 165]
```

Tetrahedral numbers,
OEIS [A000292](https://oeis.org/A000292):

~~~spl svg=A oeis=A000292
0:65.tetrahedralNumber.discretePlot
~~~

![](Help/Image/tetrahedralNumber-A.svg)

Characteristic function of tetrahedral numbers,
OEIS [A023533](https://oeis.org/A023533):

~~~spl svg=B oeis=A023533
0:22.tetrahedralNumber
.characteristicFunction
.discretePlot
~~~

![](Help/Image/tetrahedralNumber-B.svg)

* * *

See also: binomial, cube, pascalTriangle, pyramidalNumber, square, triangularNumber

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TetrahedralNumber.html),
_OEIS_
[1](https://oeis.org/A000292),
_W_
[1](https://en.wikipedia.org/wiki/Tetrahedral_number)
