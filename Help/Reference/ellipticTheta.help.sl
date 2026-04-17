# ellipticTheta

- _ellipticTheta(a, u, q)_

Answer the θ function _θa(u,q)_,
the elliptic analogs of the exponential function.

Evaluate numerically:

```
>>> 1.ellipticTheta(2, 1 / 3)
1.42788

>>> 2.ellipticTheta(5, 1 / 2)
0.183328

>>> 3.ellipticTheta(0.4, 0.5)
1.69015

>>> 3.ellipticTheta(1 / 4, 1 / 3)
1.59840
```

Complex number inputs:

```
>>> 3.ellipticTheta(0.4J1, 0J0.5)
3.9884J-1.36744
```

Value at `zero`:

```
>>> 1.ellipticTheta(0, 0)
0
```

Plot over a subset of the reals:

~~~spl svg=A
(-6 -- 6).functionPlot { :x |
	2.ellipticTheta(x, 1 / 3)
}
~~~

![](Help/Image/ellipticTheta-A.svg)

Plot the elliptic θ function for various parameters:

~~~spl svg=B
(-6 -- 6).functionPlot(
	[1 2 3 4].collect { :a |
		{ :x |
			a.ellipticTheta(x, 1 / 3)
		}
	}
)
~~~

![](Help/Image/ellipticTheta-B.svg)

_θ(1,x,1/2)_ is not injective or surjective:

~~~spl svg=C
(-6 -- 6).functionPlot { :x |
	1.ellipticTheta(x, 1 / 2)
}
~~~

![](Help/Image/ellipticTheta-C.svg)

Plot θ function near the unit circle in the complex q plane:

~~~spl svg=D
(-1.pi -- 1.pi).functionPlot { :theta |
	1.ellipticTheta(0.5, 0.9 * theta.i.exp).real
}
~~~

![](Help/Image/ellipticTheta-D.svg)

Plot θ function near the unit circle in the complex q plane:

~~~spl svg=E
(-1.pi -- 1.pi).functionPlot { :theta |
	1.ellipticTheta(0.5, 0.97 * theta.i.exp).real
}
~~~

![](Help/Image/ellipticTheta-E.svg)

* * *

See also: cos, jacobiCn, jacobiDn, jacobiSn, sin, sum

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/JacobiThetaFunctions.html)
[2](https://mathworld.wolfram.com/EllipticTheta.html),
_NIST_
[1](https://dlmf.nist.gov/20)
[2](https://dlmf.nist.gov/20.14),
_W_
[1](https://en.wikipedia.org/wiki/Theta_function)

Unicode: U+03B8 θ Greek Small Letter Theta
