# pieChart

- _pieChart([y₁ y₂ …])_

Answer a pie chart with sector angle proportional to _y_.
The chart is drawn clockwise starting at nine o’clock.

A pie chart of the first four integers:

~~~spl svg=A
[1 2 3 4].pieChart
~~~

![](Help/Image/pieChart-A.svg)

A pie chart of the first five integers:

~~~spl svg=B
[1 2 3 4 5].pieChart
~~~

![](Help/Image/pieChart-B.svg)

A pie chart of seven integers:

~~~spl svg=C
[19 16 9 3 7 2 17].pieChart
~~~

![](Help/Image/pieChart-C.svg)

A pie chart of four integers:

~~~spl svg=D
[1 2 5 3].pieChart
~~~

![](Help/Image/pieChart-D.svg)

A pie chart of five integers:

~~~spl svg=E
[8 3 5 4 9].pieChart
~~~

![](Help/Image/pieChart-E.svg)

A pie chart of eight real numbers:

~~~spl svg=F
[5.3 27.3 5.7 2.0 9.2 37.7 3.7 9.0].pieChart
~~~

![](Help/Image/pieChart-F.svg)

A pie chart of six real numbers,
with one very small value:

~~~spl svg=G
[25.1 28.8 0.6 12.2 12.5 20.8].pieChart
~~~

![](Help/Image/pieChart-G.svg)

A pie chart of eighteen real numbers,
in ascending order:

~~~spl svg=H
[
	2.43 3.28 3.42 3.79 4.07
	4.11 4.46 5.25 5.45 5.53
	5.60 6.22 7.02 7.36 7.39
	7.81 8.39 8.42
].pieChart
~~~

![](Help/Image/pieChart-H.svg)

* * *

See also: discretePlot, linePlot, polarPlot, sectorChart, squareChart

Guides: Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PieChart.html)
[2](https://reference.wolfram.com/language/ref/PieChart.html),
_W_
[1](https://en.wikipedia.org/wiki/Pie_chart)
