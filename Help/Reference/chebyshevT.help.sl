# chebyshevT

- _chebyshevT(anInteger)_

Answer a `UnivariatePolynomial` holding the Chebyshev polynomial of the first kind of degree _anInteger_.

Evaluate at specific _x_:

```
>>> 2.chebyshevT.atAll([3, 5])
[17 49]

>>> 5.chebyshevT.atAll(
>>> 	[1/6 1/4 1/3 1/2 2/3 3/4]
>>> )
[
	361/486 61/64 241/243
	1/2 -118/243 -57/64
]

>>> 12.chebyshevT.at(2.5)
73180801

>>> 0:3.collect { :n |
>>> 	n.chebyshevT.at(1/2.pi)
>>> }
[
	1,
	1/2.pi,
	-1 + (1.pi.squared / 2),
	-3/2.pi + (1.pi.cubed / 2)
]
```

Plot the fifth degree polynomial over a subset of the reals:

~~~spl svg=A
let p = 5.chebyshevT;
(-1 -- 1).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/chebyshevT-A.svg)

Plot the tenth degree polynomial over a subset of the reals:

~~~spl svg=B
let p = 10.chebyshevT;
(-1 -- 1).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/chebyshevT-B.svg)

Plot the first five polynomial over a subset of the reals:

~~~spl svg=C
let p = 0:4.collect(chebyshevT:/1);
(-1 -- 1).functionPlot(
	p.collect { :each |
		{ :x |
			each[x]
		}
	}
)
~~~

![](sw/spl/Help/Image/chebyshevT-C.svg)

* * *

See also: chebyshevU, UnivariatePolynomial

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ChebyshevPolynomialoftheFirstKind.html)
[2](https://reference.wolfram.com/language/ref/ChebyshevT.html),
_Mathworks_
[1](https://mathworks.com/help/symbolic/sym.chebyshevt.html)
_W_
[1](https://en.wikipedia.org/wiki/Chebyshev_polynomials)
