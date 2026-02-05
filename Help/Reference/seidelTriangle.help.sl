# seidelTriangle

- _seidelTriangle(n)_

Answer the first _n_ rows of the Seidel triangle,
more properly the Seidel–Entringer–Arnold triangle.
Also the Boustrophedon form of the triangle of Euler-Bernoulli or Entringer numbers read by rows.

First few terms,
OEIS [A008280](https://oeis.org/A008280):

```
>>> 8.seidelTriangle
[
	1;
	1 0;
	0 1 1;
	2 2 1 0;
	0 2 4 5 5;
	16 16 14 10 5 0;
	0 16 32 46 56 61 61;
	272 272 256 224 178 122 61 0
]
```

Log scale scatter plot of first few terms:

~~~spl svg=A
13.seidelTriangle
.catenate
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/seidelTriangle-A.svg)

* * *

See also: entringerTriangle

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Seidel-Entringer-ArnoldTriangle.html),
_OEIS_
[1](https://oeis.org/A008280)
