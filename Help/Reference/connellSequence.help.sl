# connellSequence

- _connellSequence(n)_

Answer the first _n_ rows of the Connell sequence as a triangular array.

The right edge of the Connell sequence,
OEIS [A001614](https://oeis.org/A001614),
gives the square numbers,
OEIS [A000290](https://oeis.org/A000290):

```
>>> 10.connellSequence
[
	 1;
	 2  4;
	 5  7  9;
	10 12 14 16;
	17 19 21 23 25;
	26 28 30 32 34 36;
	37 39 41 43 45 47 49;
	50 52 54 56 58 60 62 64;
	65 67 69 71 73 75 77 79 81;
	82 84 86 88 90 92 94 96 98 100
]
```

The row sums are the three-`qFactorial` numbers,
OEIS [A069778](https://oeis.org/A069778):

```
>>> 10.connellSequence.collect(sum:/1)
[1 6 21 52 105 186 301 456 657 910]

>>> 3.qFactorial(0:9)
[1 6 21 52 105 186 301 456 657 910]
```

Complement of the Connell sequence,
OEIS [A118011](https://oeis.org/A118011):

```
>>> let n = 1:13;
>>> (2 * n) + (2 * n).sqrt.round
[3 6 8 11 13 15 18 20 22 24 27 29 31]
```

The Connell sequence,
OEIS [A001614](https://oeis.org/A001614):

~~~spl svg=A oeis=A001614
9.connellSequence.catenate.discretePlot
~~~

![](sw/spl/Help/Image/connellSequence-A.svg)

Complement of the Connell sequence,
OEIS [A118011](https://oeis.org/A118011):

~~~spl svg=B oeis=A118011
let n = 1:45;
let a = (2 * n) + (2 * n).sqrt.round;
a.discretePlot
~~~

![](sw/spl/Help/Image/connellSequence-B.svg)

* * *

See also: ^

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConnellSequence.html),
_OEIS_
[1](https://oeis.org/A001614)
