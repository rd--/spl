# cosh

- _cosh(x)_

Answer the hyperbolic cosine of the number _x_.

```
>>> 1.2.cosh
1.81066
```

`cosh` can take `Complex` number inputs:

```
>>> 2.5J1.cosh
3.31329J5.09107
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].cosh
[1.81066 2.35241 3.10747]
```

Value at infinity:

```
>>> Infinity.cosh
Infinity
```

Minimum of `cosh`:

```
>>> 0.cosh
1
```

Plot over a subset of the reals:

~~~spl svg=A
(-4 -- 4).functionPlot(cosh:/1)
~~~

![](sw/spl/Help/Image/cosh-A.svg)

Plot `cosh` alongside a Padé approximation:

~~~spl svg=B
(-1.pi -- 1.pi).functionPlot([
	cosh:/1,
	coshApproximation:/1
])
~~~

![](sw/spl/Help/Image/cosh-B.svg)

* * *

See also: arcCosh, cos, sin, secanth, sinh

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HyperbolicCosine.html)
[2](https://reference.wolfram.com/language/ref/Cosh.html),
_W_
[1](https://en.wikipedia.org/wiki/Hyperbolic_functions)

Categories: Trigonometry, Math
