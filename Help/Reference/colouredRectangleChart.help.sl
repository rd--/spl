# colouredRectangleChart

- _colouredRectangleChart([x₁ y₁; x₂ y₂ …])_

Answer a coloured rectangle chart with bars of width _x_ and height _y_.

A coloured three rectangle chart:

~~~spl svg=A
[1 1; 1 2; 2 3]
.colouredRectangleChart
~~~

![](Help/Image/colouredRectangleChart-A.svg)

A coloured nine rectangle chart,
the two tuples of the set _1,2,3_:

~~~spl svg=B
[1 2 3].tuples(2)
.colouredRectangleChart
~~~

![](Help/Image/colouredRectangleChart-B.svg)

A coloured six rectangle chart:

~~~spl svg=C
[3 2; 8 5; 2 3; 1 3; 8 7; 7 1]
.colouredRectangleChart
~~~

![](Help/Image/colouredRectangleChart-C.svg)

A coloured four rectangle chart:

~~~spl svg=D
[19 16; 9 3; 7 2; 17 5]
.colouredRectangleChart
~~~

![](Help/Image/colouredRectangleChart-D.svg)

A coloured four rectangle chart:

~~~spl svg=E
[1 1; 1 2; 2 1; 2 2]
.colouredRectangleChart
~~~

![](Help/Image/colouredRectangleChart-E.svg)

A coloured five rectangle chart:

~~~spl svg=F
[1 1; 2 1; 3 2; 4 3; 5 5]
.colouredRectangleChart
~~~

![](Help/Image/colouredRectangleChart-F.svg)

A coloured four rectangle chart:

~~~spl svg=G
[
	38 24 20 18;
	13 23 7 11
].transpose.colouredRectangleChart
~~~

![](Help/Image/colouredRectangleChart-G.svg)

The left Riemann sum of _sin(x)_ in _0,π_:

~~~spl svg=H
let n = 12;
let z = 1.pi / n;
Range(0, 1.pi - z, z).sin.collect { :x |
	[z, x]
}.colouredRectangleChart
~~~

![](Help/Image/colouredRectangleChart-H.svg)

* * *

See also: barChart, colouredBarChart, rectangleChart, sectorChart

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RectangleChart.html)
