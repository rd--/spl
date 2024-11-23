# eulerMethod

- _eulerMethod(aBlock:/2, y0, x0, x1, h)_

Apply the forward Euler method for solving an ordinary differential equation.
Answer two lists, _x_ and _y_, of values at each time step.
The initial value is _y0_.
The start time is _x0_, the end time is _x1_ and the step size is _h_.

Solve and plot a first-order ordinary differential equation:

~~~
{ :x :y |
	y * (x + y).cos
}.eulerMethod(1, 0, 30, 0.05).linePlot
~~~

Newton’s cooling law, with initial value 100, and with time running from 0 to 100 in steps of 2, downsampled:

```
>>> { :x :y |
>>> 	-0.07 * (y - 20)
>>> }.eulerMethod(100, 0, 100, 2).transposed.downsample(5)
[
	  0 100.000;
	 10  57.634;
	 20  37.704;
	 30  28.328;
	 40  23.918;
	 50  21.843;
	 60  20.867;
	 70  20.408;
	 80  20.192;
	 90  20.090;
	100  20.042
]
```

Plot:

~~~
{ :x :y |
	-0.07 * (y - 20)
}.eulerMethod(100, 0, 100, 2).linePlot
~~~

Compare to analytic solution:

~~~
(0, 2 .. 100).functionPlot { :t |
	(20 + (80 * (-0.07 * t).exp))
}
~~~

* * *

See also: rungeKuttaMethod

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EulerForwardMethod.html)
[2](https://reference.wolfram.com/language/ref/NDSolve.html)
_W_
[1](https://en.wikipedia.org/wiki/Euler_method)
