# signatureSequence

- _signatureSequence(θ, p, q, n)_

Answer _n_ places of the signature sequence of θ given by the _p,q_ table of _i+jθ_.

Signature sequence of √3,
OEIS [A007337](https://oeis.org/A007337):

```
>>> 3.sqrt
>>> .signatureSequence(25, 15, 94)
[
	 1  2  1  3  2  4  1  3  5  2
	 4  6  1  3  5  7  2  4  6  1
	 8  3  5  7  2  9  4  6  1  8
	 3 10  5  7  2  9  4 11  6  1
	 8  3 10  5 12  7  2  9  4 11
	 6 13  1  8  3 10  5 12  7 14
	 2  9  4 11  6 13  1  8 15  3
	10  5 12  7 14  2  9 16  4 11
	 6 13  1  8 15  3 10 17  5 12
	 7 14  2  9
]
```

Signature sequence of φ,
OEIS [A084531](https://oeis.org/A084531):

```
>>> 1.goldenRatio
>>> .signatureSequence(30, 20, 95)
[
	 1  2  1  3  2  4  1  3  5  2
	 4  1  6  3  5  2  7  4  1  6
	 3  8  5  2  7  4  9  1  6  3
	 8  5 10  2  7  4  9  1  6 11
	 3  8  5 10  2  7 12  4  9  1
	 6 11  3  8 13  5 10  2  7 12
	 4  9  1 14  6 11  3  8 13  5
	10  2 15  7 12  4  9  1 14  6
	11  3 16  8 13  5 10  2 15  7
	12  4 17  9  1
]
```

Signature sequence of 1/φ,
OEIS [A084532](https://oeis.org/A084532):

```
>>> (1 / 1.goldenRatio)
>>> .signatureSequence(15, 25, 103)
[
	1 1 2 1  2 1 3  2  1 3
	2 4 1 3  2 4 1  3  5 2
	4 1 3 5  2 4 1  6  3 5
	2 4 1 6  3 5 2  7  4 1
	6 3 5 2  7 4 1  6  3 8
	5 2 7 4  1 6 3  8  5 2
	7 4 9 1  6 3 8  5  2 7
	4 9 1 6  3 8 5 10  2 7
	4 9 1 6  3 8 5 10  2 7
	4 9 1 6 11 3 8  5 10 2
	7 4 9
]
```

* * *

See also: sort, table

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SignatureSequence.html),
_OEIS_
[1](https://oeis.org/A007337)
[2](https://oeis.org/A084531)
[3](https://oeis.org/A084532)
