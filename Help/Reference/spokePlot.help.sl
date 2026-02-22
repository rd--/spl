# spokePlot

- _spokePlot(n, [x₁ x₂ …])_
- _spokePlot([x₁ y₁; x₂ y₂ …])_

Plot _n_ points on a circle,
starting at the top and proceeding clockwise,
and connect each point _x_ to the circle center.

Plot the fifteen modes of limited transposition for _m=12_:

~~~spl svg=A
[
	0 6;
	0 4 8;
	0 1 6 7;
	0 2 8 6;
	0 3 6 9;
	0 1 2 6 7 8;
	0 1 3 6 7 9;
	0 1 4 5 8 9;
	0 2 3 6 8 9;
	0 2 4 6 8 10;
	0 1 2 3 6 7 8 9;
	0 1 2 4 6 7 8 10;
	0 1 3 4 6 7 9 10;
	0 1 2 4 5 6 8 9 10;
	0 1 2 3 4 6 7 8 9 10
].collect { :x |
	12.spokePlot(x)
}.reshape([3 5]).PlotSet
~~~

![](sw/spl/Help/Image/spokePlot-A.svg)

A diatonic collection:

~~~spl svg=B
12.spokePlot([0 2 4 5 7 9 11])
~~~

![](sw/spl/Help/Image/spokePlot-B.svg)

A second kind of spoke plot shows the correlation between two circular variables _x_ and _y_,
each a sequence of values in radians.

~~~spl svg=C
[
	  4 105 72 105 321 93 349 64 153 14;
	110  85 86  52 224 20 100 17  45  1
].degree.spokePlot
~~~

![](sw/spl/Help/Image/spokePlot-C.svg)

Plot pair of observations, at 45° and 90° respectively:

~~~spl svg=D
[45; 90].degree.spokePlot
~~~

![](sw/spl/Help/Image/spokePlot-D.svg)

Perfectly correlated and equally spaced data:

~~~spl svg=E
let x = [0, 15 .. 345].degree;
[x x].spokePlot
~~~

![](sw/spl/Help/Image/spokePlot-E.svg)

Random, decorrelated, data:

~~~spl svg=F
Sfc32(637821)
.randomReal([0 2.pi], [2 23])
.spokePlot
~~~

![](sw/spl/Help/Image/spokePlot-F.svg)

Random, perturbed, data:

~~~spl svg=G
let n = 47;
let a = Sfc32(637821);
let b = Sfc32(289714);
let x = a.randomReal([0 2.pi], [n]);
let y = b.randomReal([-0.25 0.25], [n]);
[x, x + y].spokePlot
~~~

![](sw/spl/Help/Image/spokePlot-G.svg)

* * *

See also: circlePoints chordDiagramPlot

Guides: Plotting Functions

Further Reading: Zubairi 2008
