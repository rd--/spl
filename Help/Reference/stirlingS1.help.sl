# stirlingS1

- _stirlingS1(n, m)_

Answer the signed Stirling numbers of the first kind.

The triangle of signed Stirling numbers of the first kind,
OEIS [A008275](http://oeis.org/A008275):

```
>>> 1:6.triangularArray(stirlingS1/2)
[
	1;
	-1 1;
	2 -3 1;
	-6 11 -6 1;
	24 -50 35 -10 1;
	-120 274 -225 85 -15 1
]
```

From zero,
OEIS [A048994](https://oeis.org/A048994):

```
>>> 0:6.triangularArray(stirlingS1/2)
[
	1;
	0 1;
	0 -1 1;
	0 2 -3 1;
	0 -6 11 -6 1;
	0 24 -50 35 -10 1;
	0 -120 274 -225 85 -15 1
]
```

Unsigned from zero,
OEIS [A132393](https://oeis.org/A132393):

```
>>> 0:6.triangularArray(stirlingS1/2).abs
[
	1;
	0 1;
	0 1 1;
	0 2 3 1;
	0 6 11 6 1;
	0 24 50 35 10 1;
	0 120 274 225 85 15 1
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

Numerators of Cauchy numbers of second type,
OEIS [A002657](https://oeis.org/A002657):

```
>>> 0L:8L.collect { :n |
>>> 	0L:n.sum { :k |
>>> 		(-1L ^ (n - k))
>>> 		*
>>> 		n.stirlingS1(k)
>>> 		/
>>> 		(k + 1L)
>>> 	}
>>> }.numerator
[1 1 5 9 251 475 19087 36799 1070017]
```

Denominators of Cauchy numbers of second type,
OEIS [A002790](https://oeis.org/A002790):

```
>>> 0L:13L.collect { :n |
>>> 	0L:n.sum { :k |
>>> 		(-1L ^ k)
>>> 		*
>>> 		n.stirlingS1(k)
>>> 		/
>>> 		(k + 1L)
>>> 	}
>>> }.denominator
[1 2 6 4 30 12 84 24 90 20 132 24 5460 840]
```

Numerators of Cauchy numbers of first type,
OEIS [A006232](https://oeis.org/A006232):

```
>>> 0L:9.collect { :n |
>>> 	0:n.sum { :k |
>>> 		n.stirlingS1(k) / (k + 1)
>>> 	}
>>> }.numerator
[1 1 -1 1 -19 9 -863 1375 -33953 57281]
```

Expansion of exponential generating function _1/(1-log(1+x))_,
OEIS [A006252](https://oeis.org/A006252):

```
>>> 0L:14L.triangularArray { :n :k |
>>> 	k.! * stirlingS1(n, k)
>>> }.collect(sum/1)
[
	1 1 1 2 4 14 38 216 600 6240 9552
	319296 -519312 28108560 -176474352
]
```

Stirling numbers of the first kind,
_S(n+2,n)_,
OEIS [A000914](https://oeis.org/A000914):

```
>>> 0L:10L.collect { :n |
>>> 	(n + 2L).stirlingS1(n)
>>> }
[0 2 11 35 85 175 322 546 870 1320 1925]
```

Unsigned Stirling numbers of the first kind count the number of permutations of _k_ elements with exactly _j_ disjoint cycles:

```
>>> stirlingS1([4L 5L 6L], 1L)
[-6 24 -120]

>>> [4L 5L 6L].collect { :n |
>>> 	[1L .. n].permutations.select { :p |
>>> 		let c = p.permutationCycles;
>>> 		c.collect(size/1) = [n]
>>> 	}.size
>>> }
[6 24 120]
```

Surface plot of Stirling numbers on a logarithmic scale:

~~~spl svg=A
stirlingS1/2
.table(1L:12L, 1L:12L)
.abs
.logScale
.surfacePlot
~~~

![](Help/Image/stirlingS1-A.svg)

Sums of digits:

~~~spl svg=B
{ :n :m |
	stirlingS1(n, m).integerDigits.sum
}.table(1L:16L, 1L:16L).matrixPlot
~~~

![](Help/Image/stirlingS1-B.svg)

Triangle of arctangent numbers,
OEIS [A008309](https://oeis.org/A008309):

~~~spl svg=C oeis=A008309
(1L .. 11L).collect { :n |
	let m = 2L - (n % 2L);
	(m .. n; 2L).collect { :k |
		let a = -1L ^ ((3L * n + k) / 2L);
		let b = n.! / (2L ^ k);
		let c = (k .. n).sum { :i |
			(2L ^ i)
			*
			binomial(n - 1L, i - 1L)
			*
			stirlingS1(i, k)
			/
			i.!
		};
		a * b * c
	}
}.catenate.discretePlot.logScale
~~~

![](Help/Image/stirlingS1-C.svg)

Triangle of _s(n,n-k+1)_,
OEIS [A008276](https://oeis.org/A008276):

~~~spl svg=D oeis=A008276
1L:11L.triangularArray { :n :k |
	stirlingS1(n, n - k + 1L)
}.catenate.discretePlot.logScale
~~~

![](Help/Image/stirlingS1-D.svg)

The triangle of signed Stirling numbers of the first kind,
OEIS [A008275](http://oeis.org/A008275):

~~~spl svg=E oeis=A008275
1L:17L.triangularArray(stirlingS1/2)
.catenate.scatterPlot.logScale
~~~

![](Help/Image/stirlingS1-E.svg)

Generalized Stirling number triangle of first kind,
OEIS [A049444](https://oeis.org/A049444):

~~~spl svg=F oeis=A049444
0L:13L.triangularArray { :n :i |
	let m = n - i;
	0L:m.sum { :k |
		[
			-1L ^ k,
			binomial(n, k),
			(k + 1L).!,
			stirlingS1(n - k, i)
		].product
	}
}.catenate.discretePlot.logScale
~~~

![](Help/Image/stirlingS1-F.svg)

_k!×S1(n,k)_,
OEIS [A048594](https://oeis.org/A048594):

~~~spl svg=G oeis=A048594
1L:12L.triangularArray { :n :k |
	k.! * stirlingS1(n, k)
}.catenate.discretePlot.logScale
~~~

![](Help/Image/stirlingS1-G.svg)

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
