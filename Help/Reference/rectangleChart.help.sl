# rectangleChart

- _rectangleChart([x₁ y₁; x₂ y₂ …])_

Answer a rectangle chart with bars of width _x_ and height _y_.

A three rectangle chart:

~~~spl svg=A
[1 1; 1 2; 2 3]
.rectangleChart
~~~

![](Help/Image/rectangleChart-A.svg)

A nine rectangle chart,
the two tuples of the set _1,2,3_:

~~~spl svg=B
[1 2 3].tuples(2)
.rectangleChart
~~~

![](Help/Image/rectangleChart-B.svg)

A six rectangle chart:

~~~spl svg=C
[3 2; 8 5; 2 3; 1 3; 8 7; 7 1]
.rectangleChart
~~~

![](Help/Image/rectangleChart-C.svg)

A four rectangle chart:

~~~spl svg=D
[19 16; 9 3; 7 2; 17 5]
.rectangleChart
~~~

![](Help/Image/rectangleChart-D.svg)

A four rectangle chart:

~~~spl svg=E
[1 1; 1 2; 2 1; 2 2]
.rectangleChart
~~~

![](Help/Image/rectangleChart-E.svg)

A five rectangle chart:

~~~spl svg=F
[1 1; 2 1; 3 2; 4 3; 5 5]
.rectangleChart
~~~

![](Help/Image/rectangleChart-F.svg)

A four rectangle chart:

~~~spl svg=G
[
	38 24 20 18;
	13 23 7 11
].transpose.rectangleChart
~~~

![](Help/Image/rectangleChart-G.svg)

Multiple data sets,
two three rectangle charts:

~~~spl svg=H
[
	1 1; 1 2; 2 3
	:;
	3 1; 1 3; 2 1
].rectangleChart
~~~

![](Help/Image/rectangleChart-H.svg)

* * *

See also: barChart, sectorChart

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RectangleChart.html)
