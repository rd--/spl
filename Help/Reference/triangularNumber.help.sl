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

Threads over lists:

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

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TriangularNumber.html),
_OEIS_
[1](https://oeis.org/A000217),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_number)
