# noseHooverEquation

- _noseHooverEquation(α)_

The Nosé-Hoover equation, a non-linear third-order differential equation.

Plot system with _α=-1.1_:

~~~spl svg=A
noseHooverEquation(-1.1)
.rungeKuttaMethod(
	[-0.14 1.21 0.31],
	0, 23,
	0.1
)
.second
.linePlot
~~~

![](sw/spl/Help/Image/noseHooverEquation-A.svg)

Plot system with _α=-6.3_:

~~~spl svg=B
noseHooverEquation(-6.3)
.rungeKuttaMethod(
	[0.51 1.31 -0.47],
	0, 23,
	0.05
)
.second
.linePlot
~~~

![](sw/spl/Help/Image/noseHooverEquation-B.svg)

Plot system with _α=-0.4_:

~~~spl svg=C
noseHooverEquation(-0.4)
.rungeKuttaMethod(
	[1 2 1],
	0, 23,
	0.1
)
.second
.linePlot
~~~

![](sw/spl/Help/Image/noseHooverEquation-C.svg)

Continue with above plot:

~~~spl svg=D
noseHooverEquation(-0.4)
.rungeKuttaMethod(
	[1 2 1],
	0, 73,
	0.1
)
.second
.linePlot
~~~

![](sw/spl/Help/Image/noseHooverEquation-D.svg)

* * *

See also: arneodoEquation, rungeKuttaMethod

Guides: Chaotic Functions

References:
_Meier_
[1](http://www.3d-meier.de/tut19/Seite15.html),
_W_
[1](https://en.wikipedia.org/wiki/Nos%C3%A9%E2%80%93Hoover_thermostat)
