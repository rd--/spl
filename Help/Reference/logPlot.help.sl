# logPlot

- _logPlot(x, f:/1)_

Plot the unary function _f_ over the domain _x_,
which may be discrete or continous,
scaling the _y_ value by `log`.

Plot a function with a logarithmically scaled  axis:

~~~spl svg=A
(1 -- 5).logPlot { :x |
	x ^ x
}
~~~

![](sw/spl/Help/Image/logPlot-A.svg)

Plot several functions:

~~~spl svg=B
(1 -- 5).logPlot(
	[
		{ :x | x ^ x },
		{ :x | x.exp },
		{ :x | x.factorial }
	]
)
~~~

![](sw/spl/Help/Image/logPlot-B.svg)

Plot _x²_ and _x⁴_:

~~~spl svg=C
(0 -- 2.pi).logPlot(
	[
		{ :x | x ^ 2 },
		{ :x | x ^ 4 }
	]
)
~~~

![](sw/spl/Help/Image/logPlot-C.svg)

Plot `abs` of `gamma` at higher resolution:

~~~spl svg=D
(-5 -- 2).logPlot(300) { :x |
	x.gamma.abs.clip([0 150])
}
~~~

![](sw/spl/Help/Image/logPlot-D.svg)

* * *

See also: functionPlot, log, logLinearPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LogPlot.html)
