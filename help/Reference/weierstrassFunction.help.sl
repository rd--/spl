# weierstrassFunction

- _weierstrassFunction(x, a, m)_

A pathological function that is continuous but differentiable only on a set of points of measure zero published by Weierstrass.

Plot over the reals in _(0,1)_ with _a=2_ and _m=100_:

~~~
(0 -- 1).functionPlot { :x |
	weierstrassFunction(x, 2, 100)
}
~~~

Plot over the reals in _(0,1)_ with _a=3_ and _m=100_:

~~~
(0 -- 1).functionPlot { :x |
	weierstrassFunction(x, 3, 100)
}
~~~

Plot over the reals in _(0,1)_ with _a=4_ and _m=100_:

~~~
(0 -- 1).functionPlot { :x |
	weierstrassFunction(x, 4, 100)
}
~~~

Plot over the complex numbers in _(0,1)J0_ with _a=2_ and _m=100_:

~~~
(-0.5.pi -- 0.5.pi).complexFunctionPlot { :x |
	weierstrassFunction(x.j(0), 2, 100)
}
~~~

* * *

See also: blancmangeFunction

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WeierstrassFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Weierstrass_function)

Further Reading: Hardy 1916

Categories: Math, Function
