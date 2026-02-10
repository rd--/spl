# stirlingS1

- _stirlingS1(n, m)_

Answer the signed Stirling numbers of the first kind.

The triangle of signed Stirling numbers of the first kind,
OEIS [A008275](http://oeis.org/A008275):

```
>>> 1:6.collect { :n |
>>> 	1:n.collect { :m |
>>> 		stirlingS1(n, m)
>>> 	}
>>> }
[
	1;
	-1 1;
	2 -3 1;
	-6 11 -6 1;
	24 -50 35 -10 1;
	-120 274 -225 85 -15 1
]
```

Evaluate multiple Stirling numbers:

```
>>> 1:10.collect { :m |
>>> 	10.stirlingS1(m)
>>> }
[
	 -362880
	 1026576
	-1172700
	  723680
	 -269325
	   63273
	   -9450
	     870
	     -45
	       1
]

>>> 1:5.collect { :m |
>>> 	12.stirlingS1(m)
>>> }
[
	 -39916800
	 120543840
	-150917976
	 105258076
	 -45995730
]
```

Threads element–wise over lists:

```
>>> [2 4 6].stirlingS1(2)
[1 11 274]
```

Stirling numbers of the first kind are effectively inverses of Stirling numbers of the second kind:

```
>>> { :n :m |
>>> 	(0 .. max(n, m) + 1).sum { :l |
>>> 		stirlingS1(m, l)
>>> 		*
>>> 		stirlingS2(l, n)
>>> 	}
>>> }.table(0:5, 0:5)
[
	1 0 0 0 0 0;
	0 1 0 0 0 0;
	0 0 1 0 0 0;
	0 0 0 1 0 0;
	0 0 0 0 1 0;
	0 0 0 0 0 1
]
```

Surface plot of Stirling numbers on a logarithmic scale:

~~~spl svg=A
stirlingS1:/2
.table(1:12, 1:12)
.abs
.logScale
.surfacePlot
~~~

![](sw/spl/Help/Image/stirlingS1-A.svg)

Plot sums of digits:

~~~spl svg=B
{ :n :m |
	stirlingS1(n, m).integerDigits.sum
}.table(1:16, 1:16).matrixPlot
~~~

![](sw/spl/Help/Image/stirlingS1-B.svg)

Triangle of arctangent numbers,
OEIS [A008309](https://oeis.org/A008309):

~~~spl svg=C
1:11.collect { :n |
	let m = 2 - (n % 2);
	m:n:2.collect { :k |
		let a = -1 ^ ((3 * n + k) / 2);
		let b = n.! / (2 ^ k);
		let c = k:n.sum { :i |
			(2 ^ i)
			*
			binomial(n - 1, i - 1)
			*
			stirlingS1(i, k)
			/
			i.!
		};
		a * b * c
	}
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/stirlingS1-C.svg)

Plot triangle of _s(n,n-k+1)_,
OEIS [A008276](https://oeis.org/A008276):

~~~spl svg=D
1:11.triangularArray { :n :k |
	stirlingS1(n, n - k + 1)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/stirlingS1-D.svg)

* * *

See also: factorialPower, stirlingS2

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StirlingNumberoftheFirstKind.html)
[2](https://reference.wolfram.com/language/ref/StirlingS1.html),
_OEIS_
[1](http://oeis.org/A008275),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.stirling),
_W_
[1](https://en.wikipedia.org/wiki/Stirling_numbers_of_the_first_kind)
