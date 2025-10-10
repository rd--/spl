# entringerTriangle

- _entringerTriangle(n)_

Answer the first _n_ rows of the Entringer triangle,
also called the Euler-Bernoulli triangle.

First few terms,
OEIS [A008281](https://oeis.org/A008281):

```
>>> 8.entringerTriangle
[
	1;
	0 1;
	0 1 1;
	0 1 2 2;
	0 2 4 5 5;
	0 5 10 14 16 16;
	0 16 32 46 56 61 61;
	0 61 122 178 224 256 272 272
]
```

The Entringer numbers are the zero indexed entries in the Entringer triangle:

```
>>> entringerNumber(8, 5)
1202
```

Log scale scatter plot of first few terms:

~~~spl svg=A
13.entringerTriangle
.catenate
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/entringerTriangle-A.svg)

* * *

See also: seidelTriangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EntringerNumber.html),
_OEIS_
[1](https://oeis.org/A008281)

