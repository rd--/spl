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

Euclid’s triangle,
OEIS [A217831](https://oeis.org/A217831):

~~~spl svg=E oeis=A217831
0:20.triangularArray { :m :n |
	n.isCoprime(m).boole
}.triangularArrayPlot
~~~

![](Help/Image/triangularArrayPlot-E.svg)

Transform, _(1,0,1,…)_ in every column,
OEIS [A128174](https://oeis.org/A128174):

~~~spl svg=F oeis=A128174
0:9.triangularArray { :n :k |
	(n + k).isEven.boole
}.triangularArrayPlot
~~~

![](Help/Image/triangularArrayPlot-F.svg)

The indicator function for divisibility,
OEIS [A113704](https://oeis.org/A113704):

~~~spl svg=G oeis=A113704
0:15.triangularArray { :n :k |
	(k = 0).if {
		(n = 0).boole
	} {
		n.divisible(k).boole
	}
}.triangularArrayPlot
~~~

![](Help/Image/triangularArrayPlot-G.svg)

* * *

See also: triangularArray

Guides: Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NumberTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Triangular_array)
