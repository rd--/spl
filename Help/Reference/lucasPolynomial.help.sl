# lucasPolynomial

- _lucasPolynomial(n)_

Answer the _n_-th Lucas polynomial.

Coefficients of first few polynomials,
OEIS [A114525](https://oeis.org/A114525):

```
>>> 0:10.collect { :n |
>>> 	n.lucasPolynomial
>>>	.coefficientList
>>> }
[
	2;
	0 1;
	2 0 1;
	0 3 0 1;
	2 0 4 0 1;
	0 5 0 5 0 1;
	2 0 9 0 6 0 1;
	0 7 0 14 0 7 0 1;
	2 0 16 0 20 0 8 0 1;
	0 9 0 30 0 27 0 9 0 1;
	2 0 25 0 50 0 35 0 10 0 1
]
```

Plot coefficients table:

~~~spl svg=A
0:17.collect { :n |
	n.lucasPolynomial
	.coefficientList
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/lucasPolynomial-A.svg)

* * *

See also: lucasL, lucasNumber, lucasSequence

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LucasPolynomial.html)
[2](https://reference.wolfram.com/language/ref/LucasL.html)
