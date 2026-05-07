# barChart

- _barChart([y₁ y₂ …])_

Answer a bar chart with bar lengths _y_.

A chart of the first three integers:

~~~spl svg=A
[1 2 3].barChart
~~~

![](Help/Image/barChart-A.svg)

A chart of the first eight integers:

~~~spl svg=B
[1 .. 8].barChart
~~~

![](Help/Image/barChart-B.svg)

A bar chart of six increasing integers:

~~~spl svg=C
[1 1 2 3 5 8].barChart
~~~

![](Help/Image/barChart-C.svg)

A bar chart of seven integers:

~~~spl svg=D
[19 16 9 3 7 2 17].barChart
~~~

![](Help/Image/barChart-D.svg)

A bar chart of four integers:

~~~spl svg=E
[1 2 5 3].barChart
~~~

![](Help/Image/barChart-E.svg)

A bar chart of five integers:

~~~spl svg=F
[8 3 5 4 9].barChart
~~~

![](Help/Image/barChart-F.svg)

A bar chart of five integers,
two negative:

~~~spl svg=G
[1 -2 3 -4 5].barChart
~~~

![](Help/Image/barChart-G.svg)

* * *

See also: pieChart, rectangleChart

Guides: Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BarChart.html)
[2](https://reference.wolfram.com/language/ref/BarChart.html),
_W_
[1](https://en.wikipedia.org/wiki/Bar_chart)
