# coulletEquation

- _coulletEquation(a, b, c, d)_

The Coullet equation, a non-linear third-order differential equation.
Answers a two argument `Block`,
accepting _t_ and _(x,y,z)_,
and answering _(x′,y′,z′)_.

Plot system:

~~~spl svg=A
let [_, v] = coulletEquation(
	0.8, -1.1, -0.45, -1
).rungeKuttaMethod(
	[0.1 0.41 0.31],
	0, 67,
	0.1
);
v.linePlot
~~~

![](sw/spl/Help/Image/coulletEquation-A.svg)

* * *

See also: arneodoEquation, rungeKuttaMethod

Guides: Chaotic Functions

References:
_Meier_
[1](http://www.3d-meier.de/tut19/Seite97.html)
