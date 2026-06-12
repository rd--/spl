# bubbleChart

- _bubbleChart([x₁ y₁ z₁; x₂ y₂ z₂ …])_

Answer a bubble chart with bubbles at positions _x,y_ with sizes _z_.

Create a bubble chart for a list of triples:

~~~spl svg=A
Sfc32(973294)
.randomReal([0 1], [11 3])
.bubbleChart
~~~

![](Help/Image/bubbleChart-A.svg)

Multiple datasets:

~~~spl svg=B
Sfc32(687314)
.randomReal([0 1], [5 7 3])
.bubbleChart
~~~

![](Help/Image/bubbleChart-B.svg)

Items in a dataset are colored the same:

~~~spl svg=C
[
	1:3.collect { :i | [i, i, 1] },
	1:3.collect { :i | [i, i + 1, 1] },
	1:3.collect { :i | [i, i + 2, 1] }
].bubbleChart
~~~

![](Help/Image/bubbleChart-C.svg)

Negative co-ordinates:

~~~spl svg=D
[
	2 -4 14;
	6 25 22;
	-3 17 2;
	11 17 7;
	25 -3 21
].bubbleChart
~~~

![](Help/Image/bubbleChart-D.svg)

One item per data set:

~~~spl svg=E
[3 1 5:; 2 2 4:; 1 2 3:; 2 1.5 8]
.bubbleChart
~~~

![](Help/Image/bubbleChart-E.svg)

_y=x²%67_:

~~~spl svg=F
1:150.collect { :i |
	[i, i.square % 67, i.log]
}.bubbleChart(
	(
		zScalar: 0.2
	)
)
~~~

![](Help/Image/bubbleChart-F.svg)

* * *

See also: rectangleChart, sectorChart, scatterPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BubbleChart.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/bubblechart.html),
_W_
[1](https://en.wikipedia.org/wiki/Bubble_chart)
