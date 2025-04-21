# bernoulliTriangle

- _bernoulliTriangle(anInteger)_

Answer the first _anInteger_ rows of Bernoulli’s triangle.

The first ten rows:

```
>>> 10.bernoulliTriangle
[
	1;
	1 2;
	1 3 4;
	1 4 7 8;
	1 5 11 15 16;
	1 6 16 26 31 32;
	1 7 22 42 57 63 64;
	1 8 29 64 99 120 127 128;
	1 9 37 93 163 219 247 255 256;
	1 10 46 130 256 382 466 502 511 512
]
```

A `log` scaled scatter plot of the row-order sequence,
c.f. OEIS [A008949](https://oeis.org/A008949):

~~~spl svg=A
20.bernoulliTriangle
.catenate
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/bernoulliTriangle-A.svg)

* * *

See also: bernoulliTriangle, binomial, gouldsSequence, table, triangularNumber

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BernoulliTriangle.html),
_OEIS_
[1](https://oeis.org/A008949)
_W_
[1](https://en.wikipedia.org/wiki/Bernoulli%27s_triangle)
