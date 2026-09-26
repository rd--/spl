# colourRectangleChart

- _colourRectangleChart([x₁ y₁; x₂ y₂ …])_

Answer a colour rectangle chart with bars of width _x_ and height _y_.

A colour three rectangle chart:

~~~spl svg=A
[1 1; 1 2; 2 3]
.colourRectangleChart
~~~

![](Help/Image/colourRectangleChart-A.svg)

A colour nine rectangle chart,
the two tuples of the set _1,2,3_:

~~~spl svg=B
[1 2 3].tuples(2)
.colourRectangleChart
~~~

![](Help/Image/colourRectangleChart-B.svg)

A colour six rectangle chart:

~~~spl svg=C
[3 2; 8 5; 2 3; 1 3; 8 7; 7 1]
.colourRectangleChart
~~~

![](Help/Image/colourRectangleChart-C.svg)

A colour four rectangle chart:

~~~spl svg=D
[19 16; 9 3; 7 2; 17 5]
.colourRectangleChart
~~~

![](Help/Image/colourRectangleChart-D.svg)

A colour four rectangle chart:

~~~spl svg=E
[1 1; 1 2; 2 1; 2 2]
.colourRectangleChart
~~~

![](Help/Image/colourRectangleChart-E.svg)

A colour five rectangle chart:

~~~spl svg=F
[1 1; 2 1; 3 2; 4 3; 5 5]
.colourRectangleChart
~~~

![](Help/Image/colourRectangleChart-F.svg)

A colour four rectangle chart:

~~~spl svg=G
[
	38 24 20 18;
	13 23 7 11
].transpose.colourRectangleChart
~~~

![](Help/Image/colourRectangleChart-G.svg)

The left Riemann sum of _sin(x)_ in _0,π_:

~~~spl svg=H
let n = 12;
let z = 1.pi / n;
Range(0, 1.pi - z, z).sin.collect { :x |
	[z, x]
}.colourRectangleChart
~~~

![](Help/Image/colourRectangleChart-H.svg)

* * *

See also: barChart, colourBarChart, rectangleChart, sectorChart

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RectangleChart.html)
