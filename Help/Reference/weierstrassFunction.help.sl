# weierstrassFunction

- _weierstrassFunction(x, a, b, n=100)_

A pathological function that is continuous but differentiable only on a set of points of measure zero published by Weierstrass.

Plot over the reals in _(-1,1)_ with _a=0.634_ and _b=9_:

~~~spl svg=A
(-1 -- 1).functionPlot { :x |
	weierstrassFunction(x, 0.634, 9, 100)
}
~~~

![](sw/spl/Help/Image/weierstrassFunction-A.svg)

Plot over with varying _a_ and _b_:

~~~spl svg=B
let a = [0.816 0.380 0.248];
let b = [7 15 23];
(-1 -- 1).functionPlot(
	[1 2 3].collect { :i |
		{ :x |
			weierstrassFunction(
				x, a[i], b[i], 100
			)
		}
	}
)
~~~

![](sw/spl/Help/Image/weierstrassFunction-B.svg)

Plot over with varying _a_ and _b_:

~~~spl svg=C
let a = [0.634 0.519 0.439 0.336 0.300];
let b = [9 11 13 17 19];
(-1 -- 1).functionPlot(
	[1 .. 5].collect { :i |
		{ :x |
			weierstrassFunction(
				x, a[i], b[i], 100
			)
		}
	}
)
~~~

![](sw/spl/Help/Image/weierstrassFunction-C.svg)

* * *

See also: blancmangeFunction, riemannFunction

Guides: Curve Functions, Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WeierstrassFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Weierstrass_function)

Further Reading: Hardy 1916

Categories: Math, Function
