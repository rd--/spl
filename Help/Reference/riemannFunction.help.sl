# riemannFunction

- _riemannFunction(x, a=2, n=100)_

Plot:

~~~spl svg=A
(0 -- 1.pi).functionPlot(riemannFunction:/1)
~~~

![](sw/spl/Help/Image/riemannFunction-A.svg)

Plot with _a_ of _2,3,4_:

~~~spl svg=B
(0 -- 1.pi).functionPlot(
	[2 3 4].collect { :a |
		{ :x |
			riemannFunction(x, a, 100)
		}
	}
)
~~~

![](sw/spl/Help/Image/riemannFunction-B.svg)

Plot over the complex numbers in _(-1/2π,1/2π)_:

~~~spl svg=C
(-0.5.pi -- 0.5.pi).functionPlot { :x |
	x.j(0).riemannFunction
}
~~~

![](sw/spl/Help/Image/riemannFunction-C.svg)

* * *

See also: weierstrassFunction

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WeierstrassFunction.html)
_W_
[1](https://en.wikipedia.org/wiki/Weierstrass_function)
