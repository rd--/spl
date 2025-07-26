# doublePendulumEquation

- _doublePendulumEquation(g, [l₁ l₂], [m₁ m₂])_

A double pendulum consists of one pendulum attached to another.
The double-pendulum equation is a non-linear fourth-order differential equation.
_g_ tells the acceleration due to gravity in _m/s²_ (on Earth 9.81),
_l_ tells the lengths of the two pendulums in _m_,
_m_ tells the mass of each pendulum in _kg_.
The state vector is _[θ₁ ⍵₁ θ₂ ⍵₂]_,
where θ are the angles, in radians, from the vertical,
and ⍵ are velocities.

Plot system:

~~~spl svg=A
let g = 9.81;
let l = [1 1];
let m = [1 1];
doublePendulumEquation(g, l, m)
.rungeKuttaMethod(
	[90.degree 0 110.degree 0],
	0, 5,
	0.02
).second.collect { :v |
	let [theta1, _, theta2, _] = v;
	let x1 = l[1] * sin(theta1);
	let y1 = (0 - l[1]) * cos(theta1);
	let x2 = x1 + (l[2] * sin(theta2));
	let y2 = y1 - (l[2] * cos(theta2));
	[x2 y2]
}.scatterPlot
~~~

![](sw/spl/Help/Image/doublePendulumEquation-A.svg)

* * *

See also: rungeKuttaMethod

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://scienceworld.wolfram.com/physics/DoublePendulum.html),
_W_
[1](https://en.wikipedia.org/wiki/Double_pendulum)
