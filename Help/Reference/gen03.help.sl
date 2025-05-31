# gen03

- _gen03(size, xMin, xMax, coefficients)_

Generates a stored function table by evaluating a polynomial.
Answer a `List` of _size_ places tabulating a polynomial over a fixed interval _(xMin, xMax)_ and with specified _coefficients_.

First-order Chebyshev, _x_:

~~~spl svg=A
129.gen03(-1, 1, [0 1]).linePlot
~~~

![](sw/spl/Help/Image/gen03-A.svg)

C.f.:

~~~spl svg=B
(-1 -- 1).functionPlot(identity:/1)
~~~

![](sw/spl/Help/Image/gen03-B.svg)

Second-order Chebyshev, _2x^2 - 1_:

~~~spl svg=C
129.gen03(-1, 1, [-1 0 2]).linePlot
~~~

![](sw/spl/Help/Image/gen03-C.svg)

C.f.:

~~~spl svg=D
(-1 -- 1).functionPlot { :x |
	2 * (x ^ 2) - 1
}
~~~

![](sw/spl/Help/Image/gen03-D.svg)

Third-order Chebyshev, _4x^3 - 3x_:

~~~spl svg=E
129.gen03(-1, 1, [0 -3 0 4]).linePlot
~~~

![](sw/spl/Help/Image/gen03-E.svg)

C.f.

~~~spl svg=F
(-1 -- 1).functionPlot { :x |
	(4 * (x ^ 3)) - (3 * x)
}
~~~

![](sw/spl/Help/Image/gen03-F.svg)

Seventh-order Chebyshev, _64x^7 - 112x^5 + 56x^3 - 7x_:

~~~spl svg=G
129.gen03(
	-1,
	1,
	[0 -7 0 56 0 -112 0 64]
)
.linePlot
~~~

![](sw/spl/Help/Image/gen03-G.svg)

C.f.:

~~~spl svg=H
(-1 -- 1).functionPlot { :x |
	(64 * (x ^ 7))
	-
	(112 * (x ^ 5))
	+
	(56 * (x ^ 3))
	-
	(7 * x)
}
~~~

![](sw/spl/Help/Image/gen03-H.svg)

A 4th order polynomial function:

~~~spl svg=I
129.gen03(-1, 1, [5 4 3 2 2 1]).linePlot
~~~

![](sw/spl/Help/Image/gen03-I.svg)

* * *

See also: gen05, gen07, gen09, gen10, gen11, gen13, gen16, gen19

Guides: Csound Gen Routines

References:
_Csound_
[1](https://csound.com/docs/manual/GEN03.html)
