# bernsteinBasis

- _bernsteinBasis(d, n, x)_

Answer the _n_-th Bernstein basis function of degree _d_ at _x_.

Evaluate a Bernstein basis polynomial numerically:

```
>>> 4L.bernsteinBasis(3L, 0.5)
0.25
```

`Fraction` _x_:

```
>>> [0/1 1/2 1/1].collect { :x |
>>> 	[0L .. 3L].collect { :n |
>>> 		let d = 3L;
>>> 		d.bernsteinBasis(n, x)
>>> 	}
>>> }
[
	1/1 0/1 0/1 0/1;
	1/8 3/8 3/8 1/8;
	0/1 0/1 0/1 1/1
]
```

The _4,3_ Bernstein basis polynomial:

~~~spl svg=A
(0.0 -- 1.0).functionPlot { :x |
	4L.bernsteinBasis(3L, x)
}
~~~

![](Help/Image/bernsteinBasis-A.svg)

* * *

See also: BezierCurve, Piecewise, ^, binomial

Guides: Geometry Functions, Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BernsteinPolynomial.html)
[2](https://reference.wolfram.com/language/ref/BernsteinBasis.html)
