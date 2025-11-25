# xorTriangle

- _xorTriangle([b₁ b₂ …])_

Answer the exclusive-or triangle given an initial bit string _b_.
Each subsequent string holds the exclusive-or of the two values above it.

```
>>> [1 0 1 0 0 1 1]
>>> .xorTriangle
[
	1 0 1 0 0 1 1;
	1 1 1 0 1 0;
	0 0 1 1 1;
	0 1 0 0;
	1 1 0;
	0 1;
	1
]
```

A rotationally symmetrical triangle with side length seven,
the seventh entry in the list of such triangles at
OEIS [A334556](https://oeis.org/A334556):

~~~spl svg=A
83
.integerDigits(2)
.xorTriangle
.padRight.matrixPlot
~~~

![](sw/spl/Help/Image/xorTriangle-A.svg)

A rotationally symmetrical triangle with side length sixteen that has a central triangles of zeros:

~~~spl svg=B
59257
.integerDigits(2)
.xorTriangle
.padRight
.matrixPlot
~~~

![](sw/spl/Help/Image/xorTriangle-B.svg)

Another such triangle, the ten-thousandth listed at
OEIS [A334769](https://oeis.org/A334769):

~~~spl svg=C
325218466199
.integerDigits(2)
.xorTriangle
.padRight
.matrixPlot
~~~

![](sw/spl/Help/Image/xorTriangle-C.svg)

* * *

See also: bitXor, xor

Guides: Bitwise Functions, Geometry Functions

References:
_OEIS_
[1](https://oeis.org/A334556)
[2](https://oeis.org/A334769)
