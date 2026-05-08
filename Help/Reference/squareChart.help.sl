# squareChart

- _squareChart([y₁ y₂ …], ⍴=[10 10])_

Answer a square chart with areas proportional to _y_.
The chart is drawn from lower left to upper right in boustrophedon order.

A square chart of the first four integers:

~~~spl svg=A
[1 2 3 4].squareChart
~~~

![](Help/Image/squareChart-A.svg)

A square chart of the first five integers:

~~~spl svg=B
[1 2 3 4 5].squareChart
~~~

![](Help/Image/squareChart-B.svg)

A square chart of seven integers:

~~~spl svg=C
[19 16 9 3 7 2 17].squareChart
~~~

![](Help/Image/squareChart-C.svg)

A square chart of four integers:

~~~spl svg=D
[1 2 5 3].squareChart
~~~

![](Help/Image/squareChart-D.svg)

A square chart of five integers:

~~~spl svg=E
[8 3 5 4 9].squareChart
~~~

![](Help/Image/squareChart-E.svg)

A square chart of eight real numbers:

~~~spl svg=F
[5.3 27.3 5.7 2.0 9.2 37.7 3.7 9.0].squareChart
~~~

![](Help/Image/squareChart-F.svg)

A square chart of six real numbers,
with one very small value:

~~~spl svg=G
[25.1 28.8 0.6 12.2 12.5 20.8].squareChart
~~~

![](Help/Image/squareChart-G.svg)

A square chart of eighteen real numbers,
in ascending order:

~~~spl svg=H
[
	2.43 3.28 3.42 3.79 4.07
	4.11 4.46 5.25 5.45 5.53
	5.60 6.22 7.02 7.36 7.39
	7.81 8.39 8.42
].squareChart([15 15])
~~~

![](Help/Image/squareChart-H.svg)

* * *

See also: discretePlot, linePlot, pieChart, polarPlot, roundedPercentageAllocation, sectorChart

Guides: Plotting Functions
