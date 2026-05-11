# sinh

- _sinh(x)_

Answer the hyperbolic sine of the number _x_.

```
>>> 1.4.sinh
1.90430
```

`sinh` of _x_ is the residual mean of `exp` _x_ and _-x_:

```
>>> let x = 1.4;
>>> ((x.exp - -x.exp) / 2, x.sinh)
(1.90430, 1.90430)
```

`sinh` can take `Complex` number inputs:

```
>>> 2.5J1.sinh
3.26894J5.16014
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].sinh
[1.50946 2.12928 2.94217]

>>> [0 1 2 3].pi.sinh
[0 11.549 267.745 6195.824]
```

Integral of product of _(1-x^k)dx_,
OEIS [A258232](https://oeis.org/A258232):

```
>>> let a = (23.sqrt.pi / 6).sinh;
>>> let b = 2 * (23.sqrt.pi / 3).cosh - 1;
>>> 8 * 3/23.sqrt.pi * a / b
0.3684125359314336
```

Decimal expansion of _sinh(1)_,
OEIS [A073742](https://oeis.org/A073742):

```
>>> 1.sinh
1.1752011936438014
```

Decimal expansion of _π/sinh(π)_,
OEIS [A090986](https://oeis.org/A090986):

```
>>> 1.pi / 1.pi.sinh
0.27202905498213316

>>> 1.pi * 1.pi.csch
0.27202905498213316

>>> 1J1.gamma * 1J-1.gamma
0.27202905498213316
```

_4n(n²-1)_,
OEIS [A173121](https://oeis.org/A173121):

```
>>> (2 * 0:9.arcCosh).sinh.square
[0 0 48 288 960 2400 5040 9408 16128 25920]

>>> let n = 0:9;
>>> 4 * n.square * (n.square - 1)
[0 0 48 288 960 2400 5040 9408 16128 25920]
```

Plot over a subset of the reals:

~~~spl svg=A
(-4 -- 4).functionPlot(sinh:/1)
~~~

![](Help/Image/sinh-A.svg)

Draw a hyperbola:

~~~spl svg=B
(-1 -- 1).parametricPlot(sinh:/1, cosh:/1)
~~~

![](Help/Image/sinh-B.svg)

Plot `sinh` alongside a Padé approximation:

~~~spl svg=C
(-1.pi -- 1.pi).functionPlot([
	sinh:/1,
	sinhApproximation:/1
])
~~~

![](Help/Image/sinh-C.svg)

Plot over a subset of the complexes:

~~~spl png=D
[-0.25.pi.j(-2.5), 0.25.pi.j(2.5)]
.complexPlot(sinh:/1)
~~~

![](Help/Image/sinh-D.png)

Plot _(1+sinh(x))/exp(x)_,
the limit at _x=∞_ is one half:

~~~spl svg=E
(0 -- 10).functionPlot { :x |
	(1 + x.sinh) / x.exp
}
~~~

![](Help/Image/sinh-E.svg)

* * *

See also: arcSinh, cosh, csch, sin

Guides: Hyperbolic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HyperbolicSine.html)
[2](https://reference.wolfram.com/language/ref/Sinh.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.sinh.html)

Categories: Math, Trigonometry
