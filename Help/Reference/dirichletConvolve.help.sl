# dirichletConvolve

- _dirichletConvolve(f:/1, g:/1)_

Answer a function that is the Dirichlet convolution of the functions _f_ and _g_.

Dedekind ψ function,
OEIS [A001615](https://oeis.org/A001615):

~~~spl svg=A
1:115.collect(
	dirichletConvolve(
		{ :j | j },
		{ :j | j.moebiusMu ^ 2 }
	)
).scatterPlot
~~~

![](sw/spl/Help/Image/dirichletConvolve-A.svg)

Jordan function,
OEIS [A007434](https://oeis.org/A007434):

~~~spl svg=B
1:165.collect(
	dirichletConvolve(
		{ :k | k.moebiusMu },
		{ :k | k ^ 2 }
	)
).scatterPlot
~~~

![](sw/spl/Help/Image/dirichletConvolve-B.svg)

Convolve identity and prime predicate,
OEIS [A069359](https://oeis.org/A069359):

~~~spl svg=C
1:115.collect(
	dirichletConvolve(
		{ :n | n },
		{ :n | n.isPrime.boole }
	)
).scatterPlot
~~~

![](sw/spl/Help/Image/dirichletConvolve-C.svg)

Dirichlet convolution of natural numbers with triangular numbers,
OEIS [A309731](https://oeis.org/A309731):

~~~spl svg=D
1:115.collect(
	dirichletConvolve(
		{ :j | j },
		{ :j | j * (j + 1) / 2 }
	)
).scatterPlot
~~~

![](sw/spl/Help/Image/dirichletConvolve-D.svg)

Moebius transform of the cototient function,
OEIS [A062790](https://oeis.org/A062790):

~~~spl svg=E
1:115.collect(
	dirichletConvolve(
		{ :n | n.moebiusMu },
		{ :n | n - n.eulerPhi }
	)
).scatterPlot
~~~

![](sw/spl/Help/Image/dirichletConvolve-E.svg)

Identity:

~~~spl svg=F
1:23.collect(
	dirichletConvolve(
		{ :n | n },
		{ :n | (n - 1).kroneckerDelta }
	)
).scatterPlot
~~~

![](sw/spl/Help/Image/dirichletConvolve-F.svg)

* * *

See also: dirichletInverse, divisorSum

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DirichletConvolve.html),
_W_
[1](https://en.wikipedia.org/wiki/Dirichlet_convolution)
