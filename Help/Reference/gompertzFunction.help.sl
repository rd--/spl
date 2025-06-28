# gompertzFunction

- _gompertzFunction(a, b, c)_

Answer the Gompertz function,
a sigmoid function.

Evaluate numerically:

```
>>> [-1 0 1].collect(
>>> 	gompertzFunction(1, 1, 1)
>>> )
[1 0 -1].exp.-.exp
```

Effect of varying parameter _a_:

~~~spl svg=A
(-3 -- 6).functionPlot(
	[-0.5 1 0.5.e].collect { :a |
		gompertzFunction(a, 1, 1)
	}
)
~~~

![](sw/spl/Help/Image/gompertzFunction-A.svg)

Effect of varying parameter _b_:

~~~spl svg=B
(-3 -- 6).functionPlot(
	[4 1 0.25].collect { :b |
		gompertzFunction(1, b, 1)
	}
)
~~~

![](sw/spl/Help/Image/gompertzFunction-B.svg)

Effect of varying parameter _c_:

~~~spl svg=C
(-3 -- 6).functionPlot(
	[0.5 1 2].collect { :c |
		gompertzFunction(1, 1, c)
	}
)
~~~

![](sw/spl/Help/Image/gompertzFunction-C.svg)

* * *

See also: logisticSigmoid, richardsCurve

Guides: Curve Functions, Sigmoid Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GompertzCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Gompertz_function)

Further Reading: Gompertz 1825
