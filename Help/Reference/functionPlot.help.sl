# functionPlot

- _functionPlot(domain, aBlock:/1 | aList)_

Plot the unary function _aBlock_ over _domain_,
which may be discrete or continous.
_aBlock_ may answer a `Number`, a `Complex` or a `Sequence`.

If a list of blocks are given,
plot each function atop the previous.

`Interval` is a continuous domain, it is discretized by `functionPlot`.
Plot one cycle of the sine function:

~~~spl svg=A
(0 -- 2.pi).functionPlot(sin:/1)
~~~

![](sw/spl/Help/Image/functionPlot-A.svg)

Plot a `sin` function, defined as a block literal, over an interval:

~~~spl svg=B
(0 -- 15).functionPlot { :x |
	2 * x.sin + x
}
~~~

![](sw/spl/Help/Image/functionPlot-B.svg)

Function with varying rate of change:

~~~spl svg=C
(0 -- 2.pi).functionPlot { :x |
	(15 * x.sin).sin
}
~~~

![](sw/spl/Help/Image/functionPlot-C.svg)

Plot range selection:

~~~spl svg=D
(-1 -- 1).functionPlot { :x |
	(1 / x).clip([-10 10])
}
~~~

![](sw/spl/Help/Image/functionPlot-D.svg)

Exclude non-real values:

~~~spl svg=E
(-1 -- 1).functionPlot { :x |
	let y = x.sqrt;
	y.isComplex.if { 0 } { y }
}
~~~

![](sw/spl/Help/Image/functionPlot-E.svg)

Function with discontinuities:

~~~spl svg=F
(0 -- 100).functionPlot { :x |
	x.sqrt.floor
}
~~~

![](sw/spl/Help/Image/functionPlot-F.svg)

Focusing on areas of interest:

~~~spl svg=G
(-1.25 -- 1.25).functionPlot { :x |
	(x ^ 4) - (x ^ 2) + 1
}
~~~

![](sw/spl/Help/Image/functionPlot-G.svg)

Log plot:

~~~spl svg=H
(-4 -- 8).functionPlot { :x |
	x.gamma.abs.log
}
~~~

![](sw/spl/Help/Image/functionPlot-H.svg)

Zero crossings:

~~~spl svg=I
(0 -- 20).functionPlot { :x |
	(2.sqrt * x).sin + x.sin
}
~~~

![](sw/spl/Help/Image/functionPlot-I.svg)

At `Range`, a discrete domain:

~~~spl svg=J
1:99.functionPlot(log:/1)
~~~

![](sw/spl/Help/Image/functionPlot-J.svg)

Answering two-dimensional values, plot answer as _x,y_:

~~~spl svg=K
(-1.pi -- 1.pi).functionPlot { :x |
	[
		x.cos,
		(x * 3).sin
	]
}
~~~

![](sw/spl/Help/Image/functionPlot-K.svg)

Answering three-dimensional values, plot answer as _x,y,z_:

~~~spl svg=L
(-1.pi -- 1.pi).functionPlot { :x |
	[
		(x / 2).cos,
		(x * 3).sin,
		x.cos
	] + [0 0 1.5]
}
~~~

![](sw/spl/Help/Image/functionPlot-L.svg)

Answering `Complex` values, plot _real_ and _imaginary_ parts as _x,y_,
a spiral:

~~~spl svg=M
(0 -- 1).functionPlot { :t |
	t * (2.pi * 1.i * t).exp
}
~~~

![](sw/spl/Help/Image/functionPlot-M.svg)

At `Range`, a straight line:

~~~spl svg=N
(-3 .. 3).functionPlot { :x |
	x + x.i
}
~~~

![](sw/spl/Help/Image/functionPlot-N.svg)

At `Range`:

~~~spl svg=O
let n = 15;
1:n.functionPlot { :x |
	let y = x.isEven.if { x } { 2 * x % n };
	(2.pi.i * y / n).exp
}
~~~

![](sw/spl/Help/Image/functionPlot-O.svg)

`functionPlot` is a special case of `parametricPlot`,
where the _x_ parameter block is the identity.
A `sin` function:

~~~spl svg=P
(0 -- 5).functionPlot { :x |
	(x ^ 2).sin
}
~~~

![](sw/spl/Help/Image/functionPlot-P.svg)

The same `sin` function at `parametricPlot`:

~~~spl svg=Q
(0 -- 5).parametricPlot { :u |
	u
} { :u |
	(u ^ 2).sin
}
~~~

![](sw/spl/Help/Image/functionPlot-Q.svg)

Plot multiple functions:

~~~spl svg=R
(0 -- 1.pi).functionPlot([
	{ :x | x.sin },
	{ :x | (2 * x).sin },
	{ :x | (3 * x).sin }
])
~~~

![](sw/spl/Help/Image/functionPlot-R.svg)

Plot `sin` and `cos`:

~~~spl svg=S
(0 -- 2.pi).functionPlot([sin:/1, cos:/1])
~~~

![](sw/spl/Help/Image/functionPlot-S.svg)

Plot two `sin` functions:

~~~spl svg=T
(0 -- 3.pi).functionPlot([
	{ :x | x.sin + (x / 2) },
	{ :x | x.sin + x }
])
~~~

![](sw/spl/Help/Image/functionPlot-T.svg)

Trace over a sphere:

~~~spl svg=U
(0 -- 1.pi).functionPlot { :t |
	[
		t.sin * (10 * t).cos,
		t.sin * (10 * t).sin,
		t.cos
	]
}
~~~

![](sw/spl/Help/Image/functionPlot-U.svg)

* * *

See also: discretePlot, graphPlot, linePlot, matrixPlot, parametricPlot, scatterPlot, surfacePlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Plot.html)

Categories: Plotting
