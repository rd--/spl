# chebyshevU

- _chebyshevU(anInteger)_

Answer a `UnivariatePolynomial` holding the Chebyshev polynomial of the first kind of degree _anInteger_.

Evaluate at specific _x_:

```
>>> 2.chebyshevU.atAll([3, 5])
[35 99]

>>> 5.chebyshevU.atAll(
>>> 	[1/6 1/4 1/3 1/2 2/3 4/5]
>>> )
[
	208/243 33/32 230/243
	0/1 -308/243 -3432/3125
]

>>> 11.chebyshevU.at(2.5)
31938720

>>> 0:3.collect { :n |
>>> 	n.chebyshevU.at(pi / 2)
>>> }
[
	1,
	pi,
	-1 + pi.squared,
	-2.pi + pi.cubed
]
```

Plot the fifth degree polynomial over a subset of the reals:

~~~spl svg=A
let p = 5.chebyshevU;
(-1 -- 1).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/chebyshevU-A.svg)

Plot the tenth degree polynomial over a subset of the reals:

~~~spl svg=B
let p = 10.chebyshevU;
(-1 -- 1).functionPlot { :x |
	p[x]
}
~~~

![](sw/spl/Help/Image/chebyshevU-B.svg)

Plot the first five polynomial over a subset of the reals:

~~~spl svg=C
let p = 0:4.collect(chebyshevU:/1);
(-1 -- 1).functionPlot(
	p.collect { :each |
		{ :x |
			each[x]
		}
	}
)
~~~

![](sw/spl/Help/Image/chebyshevU-C.svg)

* * *

See also: chebyshevT, UnivariatePolynomial

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ChebyshevPolynomialoftheSecondKind.html)
[2](https://reference.wolfram.com/language/ref/ChebyshevU.html),
_Mathworks_
[1](https://mathworks.com/help/symbolic/sym.chebyshevu.html)
_W_
[1](https://en.wikipedia.org/wiki/Chebyshev_polynomials)
