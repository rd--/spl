# gen03

- _gen03(n, x⌊, x⌈, c)_

Generates a stored function table by evaluating a univariate polynomial with coefficients _c_.
Answer a `List` of _n_ places,
tabulating a polynomial over a fixed interval _(x⌊,x⌈)_,
with specified coefficients _c_.

First-order Chebyshev, _x_:

~~~spl svg=A
129.gen03(-1, 1, [0 1]).linePlot
~~~

![](Help/Image/gen03-A.svg)

C.f. _x_:

~~~spl svg=B
(-1 -- 1).functionPlot(identity/1)
~~~

![](Help/Image/gen03-B.svg)

Second-order Chebyshev, _2x^2-1_:

~~~spl svg=C
let c = 2.chebyshevT.coefficientList;
129.gen03(-1, 1, c).linePlot
~~~

![](Help/Image/gen03-C.svg)

C.f. _2x^2-1_::

~~~spl svg=D
(-1 -- 1).functionPlot(
	2.chebyshevT.unaryBlock
)
~~~

![](Help/Image/gen03-D.svg)

Third-order Chebyshev, _4x^3 - 3x_:

~~~spl svg=E
let c = 3.chebyshevT.coefficientList;
129.gen03(-1, 1, c).linePlot
~~~

![](Help/Image/gen03-E.svg)

C.f. _4x^3-3x_:

~~~spl svg=F
(-1 -- 1).functionPlot(
	3.chebyshevT.unaryBlock
)
~~~

![](Help/Image/gen03-F.svg)

Seventh-order Chebyshev,
_64x^7 - 112x^5 + 56x^3 - 7x_:

~~~spl svg=G
let c = 7.chebyshevT.coefficientList;
129.gen03(-1, 1, c).linePlot
~~~

![](Help/Image/gen03-G.svg)

C.f.:

~~~spl svg=H
(-1 -- 1).functionPlot(
	7.chebyshevT.unaryBlock
)
~~~

![](Help/Image/gen03-H.svg)

A 4th order polynomial function:

~~~spl svg=I
129.gen03(-1, 1, [5 4 3 2 2 1]).linePlot
~~~

![](Help/Image/gen03-I.svg)

* * *

See also: chebyshevT, chebyshevU, gen05, gen07, gen09, gen10, gen11, gen13, gen16, gen19

Guides: Csound Gen Routines

References:
_Csound_
[1](https://csound.com/docs/manual/GEN03.html)
