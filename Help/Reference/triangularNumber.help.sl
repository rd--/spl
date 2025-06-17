# triangularNumber

- _triangularNumber(n)_

Answer the _n_-th triangular number.

```
>>> 23.triangularNumber
276
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

Calculate arithmetic series starting at `zero`:

```
>>> let r = (0, 3 .. 21);
>>> r.sum
(r.size - 1).triangularNumber * r.step
```

* * *

See also: binomial, cubed, pascalTriangle, squared, tetrahedralNumber

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TriangularNumber.html),
_OEIS_
[1](https://oeis.org/A000217),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_number)
