# arneodoEquation

- _arneodoEquation(a, b, c)_

The Arneodo equation, a non-linear third-order differential equation.
Answers a two argument `Block`,
accepting _t_ and _(x,y,z)_,
and answering _(x′,y′,z′)_.

Plot system with parameter _a=5.5_, _b=3.5_ and _c=-1_:

~~~spl svg=A
arneodoEquation(-5.5, 3.5, -1)
.rungeKuttaMethod(
	[0.1 0 0],
	0, 43,
	0.05
)
.second
.linePlot
~~~

![](sw/spl/Help/Image/arneodoEquation-A.svg)

* * *

See also: coulletEquation, rungeKuttaMethod

Guides: Chaotic Functions

References:
_Meier_
[1](http://www.3d-meier.de/tut19/Seite4.html)
