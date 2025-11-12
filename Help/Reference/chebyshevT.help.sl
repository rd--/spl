# chebyshevT

- _chebyshevT(n)_
- _chebyshevT(n, x)_

In the unary case,
answer a `UnivariatePolynomial` holding the Chebyshev polynomial of the first kind of degree _n_.

Coefficient for the first few Chebyshev polynomials of the first kind,
OEIS [A008310](https://oeis.org/A008310):

```
>>> 0:12.collect { :n |
>>> 	let p = n.chebyshevT;
>>> 	let c = p.coefficientList;
>>> 	c.without(0)
>>> }
[
	1;
	1;
	-1 2;
	-3 4;
	1 -8 8;
	5 -20 16;
	-1 18 -48 32;
	-7 56 -112 64;
	1 -32 160 -256 128;
	9 -120 432 -576 256;
	-1 50 -400 1120 -1280 512;
	-11 220 -1232 2816 -2816 1024;
	1 -72 840 -3584 6912 -6144 2048
]
```

Evaluate at specific _x_:

```
>>> 2.chebyshevT(3)
17

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
	-1 + (1.pi.square / 2),
	-3/2.pi + (1.pi.cube / 2)
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

Plot a slice of a Banchoff–Chmutov surface:

~~~spl png=D
let f:/1 = 4.chebyshevT.asBlock;
let i = (-1.15 -- 1.15).subdivide(100);
{ :x :y |
	f(x) + f(y)
}.table(i, i).rescale.Greymap
~~~

![](sw/spl/Help/Image/chebyshevT-D.png)

Evaluate symbolically:

```
>> 2.chebyshevT(`x`)
(+ (* x (+ (* x 2) 0)) -1)

>> 3.chebyshevT(`x`)
(+ (* x (+ (* x (+ (* x 4) 0)) -3)) 0)
```

* * *

See also: chebyshevU, UnivariatePolynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ChebyshevPolynomialoftheFirstKind.html)
[2](https://reference.wolfram.com/language/ref/ChebyshevT.html),
_Mathworks_
[1](https://mathworks.com/help/symbolic/sym.chebyshevt.html),
_OEIS_
[1](https://oeis.org/A008310)
[2](https://oeis.org/A053120),
_W_
[1](https://en.wikipedia.org/wiki/Chebyshev_polynomials)
