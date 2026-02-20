# chebyshevU

- _chebyshevU(n)_

Answer a `UnivariatePolynomial` holding the Chebyshev polynomial of the second kind of degree _n_.

Coefficient for the first few Chebyshev polynomials of the second kind,
OEIS [A008312](https://oeis.org/A008312):

```
>>> 0:12.collect { :n |
>>> 	let p = n.chebyshevU;
>>> 	let c = p.coefficientList;
>>> 	c.without(0)
>>> }
[
	1;
	2;
	-1 4;
	-4 8;
	1 -12 16;
	6 -32 32;
	-1 24 -80 64;
	-8 80 -192 128;
	1 -40 240 -448 256;
	10 -160 672 -1024 512;
	-1 60 -560 1792 -2304 1024;
	-12 280 -1792 4608 -5120 2048;
	1 -84 1120 -5376 11520 -11264 4096
]
```

Evaluate at specific _x_:

```
>>> 2.chebyshevU.atAll([3 5])
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
>>> 	n.chebyshevU.at(1/2.pi)
>>> }
[
	1,
	1.pi,
	-1 + 1.pi.square,
	-2.pi + 1.pi.cube
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

Plot triangle of coefficients of Chebyshev’s _S_-polynomials,
OEIS [A049310](https://oeis.org/A049310):

~~~spl svg=D
0:19.collect { :n |
	let p = n.chebyshevU;
	let c = p.coefficientList;
	c / (2 ^ 0:n)
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/chebyshevU-D.svg)

* * *

See also: bernsteinBasis, chebyshevT, UnivariatePolynomial

Guides: Mathematical Functions, Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ChebyshevPolynomialoftheSecondKind.html)
[2](https://reference.wolfram.com/language/ref/ChebyshevU.html),
_OEIS_
[1](https://oeis.org/A008312)
[2](https://oeis.org/A053117),
_Mathworks_
[1](https://mathworks.com/help/symbolic/sym.chebyshevu.html)
_W_
[1](https://en.wikipedia.org/wiki/Chebyshev_polynomials)
