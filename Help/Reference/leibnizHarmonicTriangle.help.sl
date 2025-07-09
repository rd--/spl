# leibnizHarmonicTriangle

- _leibnizHarmonicTriangle(n)_

Answer the first _n_ rows of Leibniz’s harmonic triangle.

The first seven rows:

```
>>> 7.leibnizHarmonicTriangle
[
	1/1;
	1/2 1/2;
	1/3 1/6 1/3;
	1/4 1/12 1/12 1/4;
	1/5 1/20 1/30 1/20 1/5;
	1/6 1/30 1/60 1/60 1/30 1/6;
	1/7 1/42 1/105 1/140 1/105 1/42 1/7
]
```

A `log` scaled scatter plot of the row-order sequence,
c.f. the reciprocal of OEIS [A003506](https://oeis.org/A003506):

~~~spl svg=A
20.leibnizHarmonicTriangle
.catenate
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/leibnizHarmonicTriangle-A.svg)

* * *

See also: leibnizHarmonicTriangle, binomial, gouldsSequence, table, triangularNumber

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LeibnizHarmonicTriangle.html),
_OEIS_
[1](https://oeis.org/A003506)
_W_
[1](https://en.wikipedia.org/wiki/Leibniz_harmonic_triangle)
