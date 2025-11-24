# signatureSequence

- _signatureSequence(θ, n, p, q)_

Answer _n_ places of the signature sequence of θ given by the _p,q_ table of _i+jθ_.
If _p,q_ and are elided the table is extended automatically until the _n_-sequence is a fix point.

Signature sequence of √3,
OEIS [A007337](https://oeis.org/A007337):

```
>>> 3.sqrt
>>> .signatureSequence(94)
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
>>> .signatureSequence(95)
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
>>> .signatureSequence(103)
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

Signature sequence of φ²,
OEIS [A118276](https://oeis.org/A118276):

```
>>> 1.goldenRatio.square
>>> .signatureSequence(90)
[
	 1  2  3  1  4  2  5  3  6  1
	 4  7  2  5  8  3  6  1  9  4
	 7  2 10  5  8  3 11  6  1  9
	 4 12  7  2 10  5 13  8  3 11
	 6 14  1  9  4 12  7 15  2 10
	 5 13  8 16  3 11  6 14  1  9
	17  4 12  7 15  2 10 18  5 13
	 8 16  3 11 19  6 14  1  9 17
	 4 12 20  7 15  2 10 18  5 13
]
```

Plot:

~~~spl svg=A
1.goldenRatio.square
.signatureSequence(200)
.scatterPlot
~~~

![](sw/spl/Help/Image/signatureSequence-A.svg)

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
[4](https://oeis.org/A118276)
