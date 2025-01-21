# UnivariatePolynomial

- _UnivariatePolynomial(aList)_

A `Type` representing a univariate polynomial, specified as the sequence of descending coefficients.

Polynomial of degree two, a parabola:

~~~spl svg=A
let p = UnivariatePolynomial([1 -1 -2]);
(-2 -- 3).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-A.svg)

Polynomial of degree three:

~~~spl svg=B
let p = UnivariatePolynomial([1 3 -6 -8]);
(-5 -- 3).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-B.svg)

Polynomial of degree four:

~~~spl svg=C
let p = UnivariatePolynomial([1 0 -2 1 0]);
(-1.75 -- 1.5).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-C.svg)

Polynomial of degree six:

~~~spl svg=D
let c = [1 -21 175 -735 1624 -1764 720];
let p = UnivariatePolynomial(c);
(1 -- 6).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-D.svg)

Polynomial of degree seven, in this case the seventh Chebyshev polynomial of the first kind:

~~~spl svg=E
let c = [64 0 -112 0 56 0 -7 0];
let p = UnivariatePolynomial(c);
(-1 -- 1).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-E.svg)

Sum of two polynomials of degrees seven and eleven:

~~~spl svg=F
let p1 = 7.chebyshevT;
let p2 = 11.chebyshevT;
let p3 = p1 + p2;
(-1 -- 1).functionPlot { :x |
	p3[x]
}
~~~

![](sw/spl/Help/Image/UnivariatePolynomial-F.svg)

* * *

See also: degree, functionPlot, chebyshevT, chebyshevU

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnivariatePolynomial.html)
