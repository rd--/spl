# unitaryDivisorSigma

- _unitaryDivisorSigma(k, n)_

Answer the unitary divisor function _σ⃰ₖ(n)_,
the analog of the divisor function _σₖ(n)_ for unitary divisors

```
>>> 0.unitaryDivisorSigma(12)
4

>>> 0.unitaryDivisorSigma(120)
8
```

First few terms where _k=0_,
OEIS [A034444](https://oeis.org/A034444):

```
>>> 1:40.collect { :n |
>>> 	0.unitaryDivisorSigma(n)
>>> }
[
	1 2 2 2 2 4 2 2 2 4 2 4 2 4 4 2 2 4 2 4
	4 4 2 4 2 4 2 4 2 8 2 2 4 4 4 4 2 4 4 4
]
```

First few terms where _k=1_,
OEIS [A068068](https://oeis.org/A068068):

```
>>> 1:30.collect { :n |
>>> 	1.unitaryDivisorSigma(n)
>>> }
[
	 1  3  4  5  6 12  8  9 10 18
	12 20 14 24 24 17 18 30 20 30
	32 36 24 36 26 42 28 40 30 72
]
```

First few terms where _k=2_,
OEIS [A034676](https://oeis.org/A034676):

```
>>> 1:15.collect { :n |
>>> 	2.unitaryDivisorSigma(n)
>>> }
[
	  1   5  10  17  26
	 50  50  65  82 130
	122 170 170 250 260
]
```

Plot first few terms where _k=1_,

~~~spl svg=A
1:250.collect { :n |
	1.unitaryDivisorSigma(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/unitaryDivisorSigma-A.svg)

Plot first few terms where _k=2_,

~~~spl svg=B
1:20.collect { :n |
	2.unitaryDivisorSigma(n)
}.stepPlot
~~~

![](sw/spl/Help/Image/unitaryDivisorSigma-B.svg)

* * *

See also: divisors, divisorSigma, gcd, unitaryDivisors

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnitaryDivisorFunction.html),
_OEIS_
[1](https://oeis.org/A034444)
[2](https://oeis.org/A068068),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.udivisor_sigma),
_W_
[1](https://en.wikipedia.org/wiki/Unitary_divisor)

