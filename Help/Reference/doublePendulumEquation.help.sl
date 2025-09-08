# doublePendulumEquation

- _doublePendulumEquation(g, [l₁ l₂], [m₁ m₂])_

A double pendulum consists of one pendulum attached to another.
The double-pendulum equation is a non-linear fourth-order differential equation.
_g_ tells the acceleration due to gravity in _m/s²_ (on Earth 9.81),
_l_ tells the lengths of the two pendulums in _m_,
_m_ tells the mass of each pendulum in _kg_.

The input vector to the equation is _[θ₁ ω₁ θ₂ ω₂]_,
where θ are the angles, in radians, from the vertical,
and ω are angular velocities, initially zero.

Parametric plot for the time evolution of the angles of a double pendulum,
note that the graph resembles Brownian motion:

~~~spl svg=A
doublePendulumEquation(9.81, [1 1], [1 1])
.rungeKuttaMethod(
	[22 / 7, 0, 22 / 7, 0],
	0, 50,
	0.05
).second.collect { :v |
	[v[1], v[3]]
}.downsample(2).linePlot
~~~

![](sw/spl/Help/Image/doublePendulumEquation-A.svg)

Plot _(x,y)_ coordinates of second mass:

~~~spl svg=B
let l = [1 1];
doublePendulumEquation(9.81, l, [1 1])
.rungeKuttaMethod(
	[85.degree 0 80.degree 0],
	0, 50,
	0.05
).second.collect { :v |
	let [theta1, _, theta2, _] = v;
	let x1 = l[1] * sin(theta1);
	let y1 = (0 - l[1]) * cos(theta1);
	let x2 = x1 + (l[2] * sin(theta2));
	let y2 = y1 - (l[2] * cos(theta2));
	[x2, y2]
}.downsample(5).scatterPlot
~~~

![](sw/spl/Help/Image/doublePendulumEquation-B.svg)

* * *

See also: pendulumEquation, rungeKuttaMethod

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://scienceworld.wolfram.com/physics/DoublePendulum.html),
_W_
[1](https://en.wikipedia.org/wiki/Double_pendulum)
