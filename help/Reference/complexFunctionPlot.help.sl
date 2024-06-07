# complexFunctionPlot

- _complexFunctionPlot(d, f:/1)_

Plot the unary function _f_, which answers a `Complex` value, over the domain _d_, which may be discrete or continous.

At `Interval`, a spiral:

~~~
(0 -- 1).complexFunctionPlot { :t |
	t * (2.pi * 1.i * t).exp
}
~~~

At `Range`, a straight line:

~~~
-3:3.complexFunctionPlot { :x |
	x + x.i
}
~~~

At `Range`:

~~~
let n = 250;
1:n.complexFunctionPlot { :x |
	let y = x.isEven.if { x } { 2 * x % n };
	(2.pi.i * y / n).exp
}
~~~

* * *

See also: functionPlot, linePlot

Guides: Plotting Functions
