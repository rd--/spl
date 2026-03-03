# squareFreePart

- _squareFreePart(n)_

Answer the square-free part of _n_,
the smallest positive number _m_ such that _n/m_ is a square.

```
>>> 60.squareFreePart
15

>>> (60 / 15).isPerfectSquare
true
```

First few terms,
threads over lists,
OEIS [A007913](https://oeis.org/A007913):

```
>>> 1:77.squareFreePart
[
	 1  2  3  1  5  6  7  2  1 10
	11  3 13 14 15  1 17  2 19  5
	21 22 23  6  1 26  3  7 29 30
	31  2 33 34 35  1 37 38 39 10
	41 42 43 11  5 46 47  3  1  2
	51 13 53  6 55 14 57 58 59 15
	61 62  7  1 65 66 67 17 69 70
	71  2 73 74  3 19 77
]
```

Plot first few terms,
OEIS [A007913](https://oeis.org/A007913):

~~~spl svg=A
1:65.squareFreePart.discretePlot
~~~

![](sw/spl/Help/Image/squareFreePart-A.svg)

* * *

See also: isSquareFree

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SquarefreePart.html)
