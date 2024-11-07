# gen03

- _gen03(size, xMin, xMax, coefficients)_

Generates a stored function table by evaluating a polynomial.
Answer a `List` of _size_ places tabulating a polynomial over a fixed interval _(xMin, xMax)_ and with specified _coefficients_.

First-order Chebyshev, _x_:

~~~
513.gen03(-1, 1, [0 1]).linePlot
~~~

C.f.:

~~~
(-1 -- 1).functionPlot(identity:/1)
~~~

Second-order Chebyshev, _2x^2 - 1_:

~~~
513.gen03(-1, 1, [-1 0 2]).linePlot
~~~

C.f.:

~~~
(-1 -- 1).functionPlot { :x | 2 * (x ^ 2) - 1 }
~~~

Third-order Chebyshev, _4x^3 - 3x_:

~~~
513.gen03(-1, 1, [0 -3 0 4]).linePlot
~~~

C.f.

~~~
(-1 -- 1).functionPlot { :x | (4 * (x ^ 3)) - (3 * x) }
~~~

Seventh-order Chebyshev, _64x^7 - 112x^5 + 56x^3 - 7x_:

~~~
513.gen03(-1, 1, [0 -7 0 56 0 -112 0 64]).linePlot
~~~

C.f.:

~~~
(-1 -- 1).functionPlot { :x |
	(64 * (x ^ 7)) - (112 * (x ^ 5)) + (56 * (x ^ 3)) - (7 * x)
}
~~~

A 4th order polynomial function:

~~~
513.gen03(-1, 1, [5 4 3 2 2 1]).linePlot
~~~

* * *

See also: gen13

Guides: Csound Gen Routines

References:
_Csound_
[1](https://www.csounds.com/manual/html/GEN03.html)
