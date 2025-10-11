# qBinomial

- _qBinomial(n, m, q)_

Answer the _q_-binomial coefficient,
a _q_-analog for the binomial coefficient,
also called a Gaussian coefficient or a Gaussian polynomial.

```
>>> qBinomial(2, 1)
Polynomial([1 1])

>>> qBinomial(3, 1)
Polynomial([1 1 1])

>>> qBinomial(3, 2)
Polynomial([1 1 1])

>>> qBinomial(4, 1)
Polynomial([1 1 1 1])

>>> qBinomial(4, 2)
Polynomial([1 1 2 1 1])

>>> qBinomial(6, 3)
Polynomial([1 1 2 3 3 3 3 2 1 1])

>>> qBinomial(10, 3)
Polynomial(
	[
		 1  1  2  3  4  5  7  8  9 10 10
		10 10  9  8  7  5  4  3  2  1  1
	]
)
```

Value at _m=0_:

```
>>> qBinomial(0, 0)
Polynomial([1])

>>> qBinomial(5, 0)
Polynomial([1])
```

Zero at _m>n_:

```
>>> qBinomial(5, 12)
Polynomial([])
```

Specific values:

```
>>> qBinomial(0, 12, 5)
0

>>> qBinomial(3, 2, -0.5)
0.75
```

Exact evaluation with fractional _q_:

```
>>> qBinomial(4, 2, 1/2)
35/16

>>> 0:5.collect { :m |
>>> 	qBinomial(5, m, 1/3)
>>> }
[1 121/81 1210/729 1210/729 121/81 1]
```

Losanitsch’s triangle,
OEIS [A034851](https://oeis.org/A034851):

```
>>> 0:9.triangularArray { :n :k |
>>> 	let p = qBinomial(n, k);
>>> 	(p.at(1) + p.at(-1)) / 2
>>> }
[
	1;
	1 1;
	1 1 1;
	1 2 2 1;
	1 2 4 2 1;
	1 3 6 6 3 1;
	1 3 9 10 9 3 1;
	1 4 12 19 19 12 4 1;
	1 4 16 28 38 28 16 4 1;
	1 5 20 44 66 66 44 20 5 1
]
```

_q_-binomial is a generating function for the sequence in a grid-shading problem,
counting the number of partitions of an integer _i_
with at most _m_ parts
and largest part at most _n_:

```
>>> let n = 5;
>>> let m = 3;
>>> (1 .. n * m).collect { :i |
>>> 	i.integerPartitions.count { :x |
>>> 		x.size <= n & {
>>> 			x.max <= m
>>> 		}
>>> 	}
>>> }
[1 2 3 4 5 6 6 6 6 5 4 3 2 1 1]

>>> qBinomial(8, 3)
>>> .coefficientList
[1 1 2 3 4 5 6 6 6 6 5 4 3 2 1 1]
```

Plot for _n={1,2,3}_ over a subset of the reals:

~~~spl svg=A
(-3 -- 2).functionPlot(
	[2 3 4].collect { :n |
		qBinomial(n, 1).asBlock
	}
)
~~~

![](sw/spl/Help/Image/qBinomial-A.svg)

* * *

See also: binomial, qFactorial, qPochhammer, UnivariatePolynomial

Guides: Combinatorial Functions, Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/q-BinomialCoefficient.html)
[2](https://mathworld.wolfram.com/GridShadingProblem.html)
[3](https://reference.wolfram.com/language/ref/QBinomial.html),
_W_
[1](https://en.wikipedia.org/wiki/Gaussian_binomial_coefficient)
