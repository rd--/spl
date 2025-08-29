# rungeKuttaMethod

- _rungeKuttaMethod(aBlock:/2, y0, x0, x1, h)_

Apply the fourth-order Runge-Kutta method for solving an ordinary differential equation.
Answer two lists, _x_ and _y_, of values at each time step.
The initial value is _y0_.
The start time is _x0_, the end time is _x1_ and the step size is _h_.

Solve and plot a first-order ordinary differential equation (ODE):

~~~spl svg=A
{ :x :y |
	y * (x + y).cos
}.rungeKuttaMethod(1, 0, 30, 0.1)
.second
.linePlot
~~~

![](sw/spl/Help/Image/rungeKuttaMethod-A.svg)

Over a smaller domain with smaller time step:

~~~spl svg=B
{ :x :y |
	y * x.sin.square
}.rungeKuttaMethod(1, 0, 5, 0.05)
.second
.linePlot
~~~

![](sw/spl/Help/Image/rungeKuttaMethod-B.svg)

An equation that does not consult _y_:

~~~spl svg=C
{ :x :y |
	2 * x
}.rungeKuttaMethod(0, 0, 5, 0.1)
.second
.linePlot
~~~

![](sw/spl/Help/Image/rungeKuttaMethod-C.svg)

Solve with timestep of 0.1 and downsample to show results at time steps of one:

```
>>> let [x, y] = { :x :y |
>>> 	x * y.sqrt
>>> }.rungeKuttaMethod(1, 0, 10, 0.1);
>>> [x, y].transpose.downsample(10)
[
	 0      1.0000;
	 1      1.5625;
	 2      4.0000;
	 3     10.5625;
	 4     25.0000;
	 5     52.5625;
	 6    100.0000;
	 7    175.5625;
	 8    289.0000;
	 9    451.5625;
	10    676.0000
]
```

Solve the van der Pol equation,
a second-order ordinary differential equation,
with μ = 1,
and plot phase diagram:

~~~spl svg=D
vanDerPolEquation(1)
.rungeKuttaMethod([2 0], 0, 20, 0.1)
.second.scatterPlot
~~~

![](sw/spl/Help/Image/rungeKuttaMethod-D.svg)

Solve the Duffing equation,
a non-linear second-order ordinary differential equation,
with γ = 0.3 and δ = 0.25 and ω = 1,
and plot phase diagram:

~~~spl svg=E
duffingEquation(0.3, 0.25, 1)
.rungeKuttaMethod([0 0], 0, 23, 0.1)
.second.scatterPlot
~~~

![](sw/spl/Help/Image/rungeKuttaMethod-E.svg)

* * *

See also: eulerMethod

Guides: Numerical Methods

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Runge-KuttaMethod.html)
[2](https://reference.wolfram.com/language/ref/NDSolve.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/ode45.html),
_W_
[1](https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods)
