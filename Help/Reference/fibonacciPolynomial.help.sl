# fibonacciPolynomial

- _fibonacciPolynomial(n)_

Answer the _n_-th Fibonacci polynomial.

The fist few terms,
a signed variant is catalogued as
OEIS [A049310](https://oeis.org/A049310):

```
>>> 0:7.collect { :n |
>>> 	n.fibonacciPolynomial
>>> 	.coefficientList
>>> }
[
	;
	1;
	0 1;
	1 0 1;
	0 2 0 1;
	1 0 3 0 1;
	0 3 0 4 0 1;
	1 0 6 0 5 0 1
]
```

These are catalogued in the OEIS in reverse sequence,
OEIS [A162515](https://oeis.org/A162515):

```
>>> 0:12.collect { :n |
>>> 	n.fibonacciPolynomial
>>> 	.coefficientList
>>> 	.reverse
>>> }
[
	;
	1;
	1 0;
	1 0 1;
	1 0 2 0;
	1 0 3 0 1;
	1 0 4 0 3 0;
	1 0 5 0 6 0 1;
	1 0 6 0 10 0 4 0;
	1 0 7 0 15 0 10 0 1;
	1 0 8 0 21 0 20 0 5 0;
	1 0 9 0 28 0 35 0 15 0 1;
	1 0 10 0 36 0 56 0 35 0 6 0
]
```

Plot first few terms:

~~~spl svg=A
(-1 -- 1).functionPlot(
	1:6.collect { :n |
		n.fibonacciPolynomial
		.asBlock
	}
)
~~~

![](sw/spl/Help/Image/fibonacciPolynomial-A.svg)

* * *

See also: fibonacci, UnivariatePolynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FibonacciPolynomial.html),
_OEIS_
[1](https://oeis.org/A162515)
[2](https://oeis.org/A049310),
_W_
[1](https://en.wikipedia.org/wiki/Fibonacci_polynomials)
