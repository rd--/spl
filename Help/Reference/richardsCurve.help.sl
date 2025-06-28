# richardsCurve

- _richardsCurve(a, k, b, ν, q, c)_

Answer the generalized logistic function,
also called Richards’s curve.

Plot over a subset of the reals:

~~~spl svg=A
(-1.5 -- 3.5).functionPlot(
	richardsCurve(0, 1, 3, 0.5, 0.5, 1)
)
~~~

![](sw/spl/Help/Image/richardsCurve-A.svg)

Effect of varying parameter _a_,
all other parameters are 1:

~~~spl svg=B
(-6 -- 6).functionPlot(
	[-1 0 1 2].collect { :a |
		richardsCurve(a, 1, 1, 1, 1, 1)
	}
)
~~~

![](sw/spl/Help/Image/richardsCurve-B.svg)

Effect of varying parameter _b_,
_a=0_, all other parameters are one:

~~~spl svg=C
(-6 -- 6).functionPlot(
	[0.1 0.5 1 2 5].collect { :b |
		richardsCurve(0, 1, b, 1, 1, 1)
	}
)
~~~

![](sw/spl/Help/Image/richardsCurve-C.svg)

Effect of varying parameter _c_,
_a=0_, all other parameters are one:

~~~spl svg=D
(-6 -- 6).functionPlot(
	[0.1 0.5 1 2 5].collect { :c |
		richardsCurve(0, 1, 1, 1, 1, c)
	}
)
~~~

![](sw/spl/Help/Image/richardsCurve-D.svg)

Effect of varying parameter _k_,
_a=0_, all other parameters are one:

~~~spl svg=E
(-6 -- 6).functionPlot(
	[0.1 0.5 1 2].collect { :k |
		richardsCurve(0, k, 1, 1, 1, 1)
	}
)
~~~

![](sw/spl/Help/Image/richardsCurve-E.svg)

Effect of varying parameter _q_,
_a=0_, all other parameters are one:

~~~spl svg=F
(-6 -- 6).functionPlot(
	[0.1 0.5 1 2 5].collect { :q |
		richardsCurve(0, 1, 1, 1, q, 1)
	}
)
~~~

![](sw/spl/Help/Image/richardsCurve-F.svg)

Effect of varying parameter ν,
_a=0_, all other parameters are one:

~~~spl svg=G
(-6 -- 6).functionPlot(
	[0.5 1 2].collect { :nu |
		richardsCurve(0, 1, 1, nu, 1, 1)
	}
)
~~~

![](sw/spl/Help/Image/richardsCurve-G.svg)

* * *

See also: gompertzFunction, logisticSigmoid

Guides: Curve Functions, Sigmoid Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Generalised_logistic_function)

Further Reading: Richards 1959
