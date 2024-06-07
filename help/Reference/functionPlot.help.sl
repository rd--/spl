# functionPlot

- _functionPlot(d, f:/1)_

Plot the unary function _f_ over the domain _d_, which may be discrete or continous.
_f_ may answer a `Number`, a `Complex` or a `Sequence`.

`Interval` is a continuous domain, it is discretized by `functionPlot`.
Plot one cycle of the sine function:

~~~
(0 -- 2.pi).functionPlot(sin:/1)
~~~

Plot a `sin` function over an interval defined as a block literal:

~~~
(0 -- 15).functionPlot { :x |
	2 * x.sin + x
}
~~~

Function with varying rate of change:

~~~
(0 -- 2.pi).functionPlot { :x |
	(30 * x.sin).sin
}
~~~

Plot range selection:

~~~
(-1 -- 1).functionPlot { :x |
	(1 / x).clip(-10, 10)
}
~~~

Exclude non-real values:

~~~
(-1 -- 1).functionPlot { :x |
	let y = x.sqrt;
	y.isComplex.if { 0 } { y }
}
~~~

Function with discontinuities:

~~~
(0 -- 100).functionPlot { :x |
	x.sqrt.floor
}
~~~

Focusing on areas of interest:

~~~
(-1.25 -- 1.25).functionPlot { :x |
	(x ^ 4) - (x ^ 2) + 1
}
~~~

Log plot:

~~~
(-4 -- 8).functionPlot { :x |
	x.gamma.abs.log
}
~~~

Zero crossings:

~~~
(0 -- 20).functionPlot { :x |
	(2.sqrt * x).sin + x.sin
}
~~~

At `Range`, a discrete domain:

~~~
1:99.functionPlot(log:/1)
~~~

Answering two-dimensional values, plot answer as _x,y_:

~~~
(-1.pi -- 1.pi).functionPlot { :x |
	[x.cos, (x * 3).sin]
}
~~~

Answering three-dimensional values, plot answer as _x,y,z_:

~~~
(-1.pi -- 1.pi).functionPlot { :x |
	[x.cos, (x * 3).sin, (x * 3).cos]
}
~~~

Answering `Complex` values, plot _real_ and _imaginary_ parts as _x,y_,
a spiral:

~~~
(0 -- 1).functionPlot { :t |
	t * (2.pi * 1.i * t).exp
}
~~~

At `Range`, a straight line:

~~~
-3:3.functionPlot { :x |
	x + x.i
}
~~~

At `Range`:

~~~
let n = 250;
1:n.functionPlot { :x |
	let y = x.isEven.if { x } { 2 * x % n };
	(2.pi.i * y / n).exp
}
~~~


* * *

See also: discretePlot, linePlot, scatterPlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Plot.html)
