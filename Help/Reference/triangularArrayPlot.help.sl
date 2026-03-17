# triangularArrayPlot

- _triangularArrayPlot(a)_

Plot the triangular array _a_,
which may be inverted.

An order six triangular array:

~~~spl svg=A
[
	1;
	0 1;
	0 0 1;
	1 1 1 0;
	0 1 0 1 1;
	1 1 0 0 1 0
].triangularArrayPlot
~~~

![](Help/Image/triangularArrayPlot-A.svg)

An inverted triangular array with side length eight:

~~~spl svg=B
151
.integerDigits(2)
.xorTriangle
.triangularArrayPlot
~~~

![](Help/Image/triangularArrayPlot-B.svg)

Plot Pascal’s triangle,
rescaled to lie in _(0,1)_:

~~~spl svg=C
7.pascalTriangle
.rescale
.triangularArrayPlot
~~~

![](Help/Image/triangularArrayPlot-C.svg)

Plot Sierpiński’s triangle:

~~~spl svg=D
(16.pascalTriangle % 2)
.triangularArrayPlot
~~~

![](Help/Image/triangularArrayPlot-D.svg)

* * *

See also: triangularArray

Guides: Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NumberTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_array)
