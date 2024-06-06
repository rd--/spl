# rungeKuttaMethod

- _rungeKuttaMethod(aBlock:/2, y0, x0, x1, h)_

Apply the fourth-order Runge-Kutta method for solving an ordinary differential equation.
Answer two lists, _x_ and _y_, of values at each time step.
The initial value is _y0_.
The start time is _x0_, the end time is _x1_ and the step size is _h_.

Solve and plot a first-order ordinary differential equation (ODE):

~~~
{ :x :y |
	y * (x + y).cos
}.rungeKuttaMethod(1, 0, 30, 0.1).linePlot
~~~

Over a smaller domain with smaller time step:

~~~
{ :x :y |
	y * x.sin.squared
}.rungeKuttaMethod(1, 0, 5, 0.05).linePlot
~~~

An equation that does not consult _y_:

~~~
{ :x :y |
	2 * x
}.rungeKuttaMethod(0, 0, 5, 0.1).linePlot
~~~

Solve with timestep of 0.1 and downsample to show results at time steps of one:

```
>>> let [x, y] = { :x :y |
>>> 	x * y.sqrt
>>> }.rungeKuttaMethod(1, 0, 10, 0.1);
>>> [x, y].transposed.downsample(10)
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

Solve van der Pol equation, a second-order ODE, with mu = 1, plot phase diagram:

~~~
let vdp = { :x :y |
	[
		y[2],
		(1 - (y[1] ^ 2)) * y[2] - y[1]
	]
};
let [x, y] = vdp:/2.rungeKuttaMethod([2 0], 0, 20, 0.1);
let [y1, y2] = y.transposed;
[y1, y2].linePlot
~~~

* * *

See also: eulerMethod

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Runge-KuttaMethod.html)
[2](https://reference.wolfram.com/language/ref/NDSolve.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/ode45.html),
_W_
[1](https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods)
