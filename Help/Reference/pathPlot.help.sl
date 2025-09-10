# pathPlot

- _pathPlot([x₁ y₁; x₂ y₂…], [t₁ t₂ …])_

Plot the path,
or trajectory,
specified by a sequence of Cartesian coordinates.
The plot is a line drawing,
an animated point follows the indicated path with the indicated timing.

If no time points are specified,
each segment is assigned a duration of one second,
longer segments are traversed at higher velocity:

~~~spl svg=A
[0 0; 1 1; 5 1; 5 5; 1 1; 1 0; 0 0]
.pathPlot
~~~

![](sw/spl/Help/Image/pathPlot-A.svg)

A square traversed at the specified timing sequence:

~~~spl svg=B
[0 0; 1 0; 1 1; 0 1; 0 0].pathPlot(
	[0 0.5 1.5 3 5]
)
~~~

![](sw/spl/Help/Image/pathPlot-B.svg)

Plot solution to the double pendulum equation,
indicating the trajectory of the second mass:

~~~spl svg=C
let l = [1 1];
let [t, v] = doublePendulumEquation(
	9.81, l, [1 1]
).rungeKuttaMethod(
	[85.degree 0 80.degree 0],
	0, 50,
	0.05
);
v.collect { :v |
	let [a, _, b, _] = v;
	let x1 = l[1] * sin(a);
	let y1 = (0 - l[1]) * cos(a);
	let x2 = x1 + (l[2] * sin(b));
	let y2 = y1 - (l[2] * cos(b));
	[x2, y2]
}.pathPlot(t)
~~~

![](sw/spl/Help/Image/pathPlot-C.svg)

* * *

See also: linePlot, scatterPlot

Guides: Plotting Functions
