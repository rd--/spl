# colourBarChart

- _colourBarChart([y₁ y₂ …])_

Answer a colour bar chart with bar lengths _y_.

A colour bar chart of the first three integers:

~~~spl svg=A
[1 2 3].colourBarChart
~~~

![](Help/Image/colourBarChart-A.svg)

A colour bar chart of the first eight integers:

~~~spl svg=B
[1 .. 8].colourBarChart
~~~

![](Help/Image/colourBarChart-B.svg)

A colour bar chart of six increasing integers:

~~~spl svg=C
[1 1 2 3 5 8].colourBarChart
~~~

![](Help/Image/colourBarChart-C.svg)

A colour bar chart of seven integers:

~~~spl svg=D
[19 16 9 3 7 2 17].colourBarChart
~~~

![](Help/Image/colourBarChart-D.svg)

A colour bar chart of four integers:

~~~spl svg=E
[1 2 5 3].colourBarChart
~~~

![](Help/Image/colourBarChart-E.svg)

A colour bar chart of five integers:

~~~spl svg=F
[8 3 5 4 9].colourBarChart
~~~

![](Help/Image/colourBarChart-F.svg)

A colour bar chart of five integers,
two negative:

~~~spl svg=G
[1 -2 3 -4 5].colourBarChart
~~~

![](Help/Image/colourBarChart-G.svg)

* * *

See also: barChart, colourRectangleChart, pieChart, rectangleChart

Guides: Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BarChart.html)
[2](https://reference.wolfram.com/language/ref/BarChart.html),
_W_
[1](https://en.wikipedia.org/wiki/Bar_chart)
