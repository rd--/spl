# colouredBarChart

- _colouredBarChart([y₁ y₂ …])_

Answer a coloured bar chart with bar lengths _y_.

A coloured bar chart of the first three integers:

~~~spl svg=A
[1 2 3].colouredBarChart
~~~

![](Help/Image/colouredBarChart-A.svg)

A coloured bar chart of the first eight integers:

~~~spl svg=B
[1 .. 8].colouredBarChart
~~~

![](Help/Image/colouredBarChart-B.svg)

A coloured bar chart of six increasing integers:

~~~spl svg=C
[1 1 2 3 5 8].colouredBarChart
~~~

![](Help/Image/colouredBarChart-C.svg)

A coloured bar chart of seven integers:

~~~spl svg=D
[19 16 9 3 7 2 17].colouredBarChart
~~~

![](Help/Image/colouredBarChart-D.svg)

A coloured bar chart of four integers:

~~~spl svg=E
[1 2 5 3].colouredBarChart
~~~

![](Help/Image/colouredBarChart-E.svg)

A coloured bar chart of five integers:

~~~spl svg=F
[8 3 5 4 9].colouredBarChart
~~~

![](Help/Image/colouredBarChart-F.svg)

A coloured bar chart of five integers,
two negative:

~~~spl svg=G
[1 -2 3 -4 5].colouredBarChart
~~~

![](Help/Image/colouredBarChart-G.svg)

* * *

See also: barChart, pieChart, rectangleChart

Guides: Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BarChart.html)
[2](https://reference.wolfram.com/language/ref/BarChart.html),
_W_
[1](https://en.wikipedia.org/wiki/Bar_chart)
