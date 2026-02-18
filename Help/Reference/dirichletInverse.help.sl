# dirichletInverse

- _dirichletInverse(f:/1)_

Answer the Dirichlet inverse of the unary function _f_.

Dirichlet inverse of the gcd-sum function,
OEIS [A101035](https://oeis.org/A101035):

~~~spl svg=A
1:115.collect(
	gcdSum:/1.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-A.svg)

Dirichlet inverse of the Euler totient function,
also called the reciprocity balance of _n_,
OEIS [A023900](https://oeis.org/A023900):

~~~spl svg=B
1:115.collect(
	eulerPhi:/1.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-B.svg)

Dirichlet inverse of the σ function,
OEIS [A046692](https://oeis.org/A046692):

~~~spl svg=C
1:115.collect(
	{ :n |
		1.divisorSigma(n)
	}.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-C.svg)

Dirichlet inverse of the deficiency of _n_,
OEIS [A033879](https://oeis.org/A033879):

~~~spl svg=D
1:115.collect(
	{ :n |
		(2 * n) - 1.divisorSigma(n)
	}.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-D.svg)

Dirichlet inverse of the Dedekind ψ function,
OEIS [A323363](https://oeis.org/A323363):

~~~spl svg=E
1:115.collect(
	{ :n |
		n * n.divisorSum { :d |
			d.moebiusMu ^ 2 / d
		}
	}.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-E.svg)

Dirichlet inverse of the _σ(3)_ function,
OEIS [A053825](https://oeis.org/A053825):

~~~spl svg=F
1:115.collect(
	{ :n |
		3.divisorSigma(n)
	}.dirichletInverse
).logScale.discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-F.svg)

Dirichlet inverse of the Stern diatomic sequence,
OEIS [A317843](https://oeis.org/A317843):

~~~spl svg=G
1:115.collect(
	sternBrocotNumber:/1
	.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/dirichletInverse-G.svg)

* * *

See also: dirichletConvolve, divisors

References:
_W_
[1](https://en.wikipedia.org/wiki/Dirichlet_series_inversion)
[2](https://en.wikipedia.org/wiki/Dirichlet_convolution)
