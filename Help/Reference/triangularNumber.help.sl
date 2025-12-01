# triangularNumber

- _triangularNumber(n)_

Answer the _n_-th triangular number.

```
>>> 23.triangularNumber
276
```

Relation to `binomial`:

```
>>> 23.triangularNumber
(23 + 1).binomial(2)
```

Threads over lists,
OEIS [A000217](https://oeis.org/A000217):

```
>>> 0:23.triangularNumber
[
	  0   1   3   6  10  15  21  28
	 36  45  55  66  78  91 105 120
	136 153 171 190 210 231 253 276
]
```

The _n_-th partial sum of the natural integer series is the _n_-th triangular number:

```
>>> 1:23.sum
23.triangularNumber
```

Calculate arithmetic series starting at `zero`:

```
>>> let r = (0, 3 .. 21);
>>> r.sum
(r.size - 1).triangularNumber * r.step
```

Calculate the first _n_ rows and _m_ columns of the infinite matrix counted by antidiagonals:

```
>>> let n = 7;
>>> let m = 8;
>>> 1:n.collect { :i |
>>> 	let a = i.triangularNumber;
>>> 	1:m.collect { :j |
>>> 		let b = Range(i, i + j - 2, 1);
>>> 		a + b.sum
>>> 	}
>>> }
[
	 1  2  4  7 11 16 22 29;
	 3  5  8 12 17 23 30 38;
	 6  9 13 18 24 31 39 48;
	10 14 19 25 32 40 49 59;
	15 20 26 33 41 50 60 71;
	21 27 34 42 51 61 72 84;
	28 35 43 52 62 73 85 98
]
```

The reciprocals of triangular numbers produce is convergent series where the limit is two:

~~~spl svg=A
1:47.triangularNumber
.reciprocal
.prefixSum
.linePlot
~~~

![](sw/spl/Help/Image/triangularNumber-A.svg)

* * *

See also: binomial, cube, pascalTriangle, square, tetrahedralNumber

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TriangularNumber.html),
_OEIS_
[1](https://oeis.org/A000217)
[2](https://oeis.org/A008302),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_number)
