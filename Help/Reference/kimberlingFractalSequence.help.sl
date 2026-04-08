# kimberlingFractalSequence

- _kimberlingFractalSequence(r, n)_

Answer a triangular array of _n_ rows that,
when read as a sequence by rows,
is a fractal sequence induced by the irrational number _r_.
The _n_-th row gives the ordering of the fractional parts of the first _n_ multiples of _r_.

Fractal sequence induced by φ,
OEIS [A054065](https://oeis.org/A054065):

```
>>> 1.goldenRatio
>>> .kimberlingFractalSequence(9)
[
	1;
	2 1;
	2 1 3;
	2 4 1 3;
	5 2 4 1 3;
	5 2 4 1 6 3;
	5 2 7 4 1 6 3;
	5 2 7 4 1 6 3 8;
	5 2 7 4 9 1 6 3 8
]
```

Fractal sequence induced by φ,
OEIS [A054065](https://oeis.org/A054065):

~~~spl svg=A oeis=A054065
1.goldenRatio
.kimberlingFractalSequence(17)
.catenate.discretePlot
~~~

![](Help/Image/kimberlingFractalSequence-A.svg)

Fractal sequence induced by √2,
OEIS [A054073](https://oeis.org/A054073):

~~~spl svg=B oeis=A054073
2.sqrt
.kimberlingFractalSequence(15)
.catenate.discretePlot
~~~

![](Help/Image/kimberlingFractalSequence-B.svg)

Fractal sequence induced by -√2,
OEIS [A194835](https://oeis.org/A194835):

~~~spl svg=C oeis=A194835
2.sqrt.-
.kimberlingFractalSequence(15)
.catenate.discretePlot
~~~

![](Help/Image/kimberlingFractalSequence-C.svg)

* * *

See also: fractionalPart, sort

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A194832)
