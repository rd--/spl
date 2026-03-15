# seidelEntringerArnoldTriangle

- _seidelEntringerArnoldTriangle(n)_

Answer the first _n_ rows of the Seidel–Entringer–Arnold triangle.
Also the Boustrophedon form of the triangle of Euler-Bernoulli or Entringer numbers read by rows.

First rows of the Seidel–Entringer–Arnold triangle,
OEIS [A008280](https://oeis.org/A008280):

```
>>> 8.seidelEntringerArnoldTriangle
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

The first few terms of the Seidel–Entringer–Arnold triangle,
log scale scatter plot,
OEIS [A008280](https://oeis.org/A008280):

~~~spl svg=A oeis=A008280
13.seidelEntringerArnoldTriangle
.catenate
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/seidelEntringerArnoldTriangle-A.svg)

* * *

See also: entringerTriangle, seidelTriangle

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Seidel-Entringer-ArnoldTriangle.html),
_OEIS_
[1](https://oeis.org/A008280)
