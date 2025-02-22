# bernsteinBasis

- _bernsteinBasis(d, n, x)_

Answer the _n_-th Bernstein basis function of degree _d_ at _x_.

Evaluate a Bernstein basis polynomial numerically:

```
>>> 4.bernsteinBasis(3, 0.5)
0.25

>>> [0 0.5 1].collect { :x |
>>> 	[0 1 2 3].collect { :n |
>>> 		let d = 3;
>>> 		d.bernsteinBasis(n, x)
>>> 	}
>>> }
[
	1 0 0 0;
	1/8 6/16 6/16 1/8;
	0 0 0 1
]
```

Plot:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	4.bernsteinBasis(3, x)
}
~~~

![](sw/spl/Help/Image/bernsteinBasis-A.svg)

* * *

See also: ^, BezierCurve, binomial, Piecewise

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BernsteinPolynomial.html)
[2](https://reference.wolfram.com/language/ref/BernsteinBasis.html)

Categories: Math, Geometry
