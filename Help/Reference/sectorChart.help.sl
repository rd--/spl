# sectorChart

- _sectorChart([x₁ y₁; x₂ y₂ …])_

Answer a sector chart with sector angles proportional to _x_ and radii _y_.

A three sector chart,
equal angles and increasing radii:

~~~spl svg=A
[1 1; 1 2; 1 3].sectorChart
~~~

![](Help/Image/sectorChart-A.svg)

A three sector chart,
decreasing angles and radii:

~~~spl svg=B
[7 3; 5 2; 1 1].sectorChart
~~~

![](Help/Image/sectorChart-B.svg)

A nine sector chart,
the two tuples of the set _1,2,3_:

~~~spl svg=C
[1 2 3].tuples(2).sectorChart
~~~

![](Help/Image/sectorChart-C.svg)

A five sector chart,
increasing angles and radii:

~~~spl svg=D
[1 2; 1 3; 2 5; 3 7; 5 11]
.sectorChart
~~~

![](Help/Image/sectorChart-D.svg)

A four sector chart:

~~~spl svg=E
[19 16; 9 3; 7 2; 17 5]
.sectorChart
~~~

![](Help/Image/sectorChart-E.svg)

A four sector chart:

~~~spl svg=F
[2 3; 4 6; 5 8; 3 7]
.sectorChart
~~~

![](Help/Image/sectorChart-F.svg)

A three sector chart:

~~~spl svg=G
[1 2; 3 4; 5 6].sectorChart
~~~

![](Help/Image/sectorChart-G.svg)

A ten sector chart of random integers:

~~~spl svg=H
Sfc32(813749)
.randomInteger([1 4], [10 2])
.sectorChart
~~~

![](Help/Image/sectorChart-H.svg)

* * *

See also: barChart, bubbleChart, pieChart, rectangleChart

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SectorChart.html)
