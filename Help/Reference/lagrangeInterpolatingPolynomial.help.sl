# lagrangeInterpolatingPolynomial

- _lagrangeInterpolatingPolynomial(c)_

Answer the Lagrange interpolating polynomial for the coordinates _c_.

```
>>> [1 1; 2 4; 3 1; 4 5]
>>> .lagrangeInterpolatingPolynomial
>>> .coefficientList
[-21 215/6 -16 13/6]

>>> [1 1; 2 4; 3 9; 4 16]
>>> .lagrangeInterpolatingPolynomial
>>> .coefficientList
[0 0 1 0]

>>> [-1 4; 0 2; 1 6]
>>> .lagrangeInterpolatingPolynomial
>>> .coefficientList
[2 1 3]
```

Plot interpolation over five points:

~~~spl svg=A
let c = [1 4; 2 7; 3 2; 4 8; 5 9];
let p = c.lagrangeInterpolatingPolynomial;
(0.5 -- 5.5).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/lagrangeInterpolatingPolynomial-A.svg)

Plot interpolation over four points:

~~~spl svg=B
let c = [-9 5; -4 2; -1 -2; 7 9];
let p = c.lagrangeInterpolatingPolynomial;
(-9 -- 7).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/lagrangeInterpolatingPolynomial-B.svg)

Interpolation divergence for a set of Lagrange polynomials:

~~~spl svg=C
let y = [0 0 0.05 0.15 0.6 1 0.6 0.15 0.05 0 0];
let x = [-5 .. 5];
let c = [x, y].transposed;
let p = c.lagrangeInterpolatingPolynomial;
(-5 -- 5).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/lagrangeInterpolatingPolynomial-C.svg)

* * *

See also: UnivariatePolynomial

Guides: Interpolation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LagrangeInterpolatingPolynomial.html)
[2](https://reference.wolfram.com/language/ref/InterpolatingPolynomial.html),
_W_
[1](https://en.wikipedia.org/wiki/Lagrange_polynomial)
