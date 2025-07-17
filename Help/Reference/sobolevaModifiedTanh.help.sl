# sobolevaModifiedTanh

- _sobolevaModifiedTanh(a, b, c, d)_

The Soboleva modified hyperbolic tangent is a special sigmoid function based on the hyperbolic tangent.

Effect of varying parameter _d_:

~~~spl svg=A
(-3 -- 3).functionPlot(
	[1 2 4 16].collect { :d |
		sobolevaModifiedTanh(1, 1, 1, d)
	}
)
~~~

![](sw/spl/Help/Image/sobolevaModifiedTanh-A.svg)

Effect of varying parameter _c_:

~~~spl svg=B
(-3 -- 3).functionPlot(
	[1 2 4 16].collect { :c |
		sobolevaModifiedTanh(1, 1, c, 1)
	}
)
~~~

![](sw/spl/Help/Image/sobolevaModifiedTanh-B.svg)

Effect of varying parameter _b=d_:

~~~spl svg=C
(-3 -- 3).functionPlot(
	[1 2 4 16].collect { :p |
		sobolevaModifiedTanh(1, p, 1, p)
	}
)
~~~

![](sw/spl/Help/Image/sobolevaModifiedTanh-C.svg)

Effect of varying parameters _c_ and _d_:

~~~spl svg=D
(-3 -- 3).functionPlot(
	[1 1; 2 2; 2 8; 4 4; 8 2; 16 16]
	.collect { :p |
		let [c, d] = p;
		sobolevaModifiedTanh(1, 1, c, d)
	}
)
~~~

![](sw/spl/Help/Image/sobolevaModifiedTanh-D.svg)

* * *

See also: tanh

Guides: Sigmoid Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Soboleva_modified_hyperbolic_tangent)
