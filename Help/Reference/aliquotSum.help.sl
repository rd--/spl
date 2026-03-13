# aliquotSum

- _aliquotSum(n)_

Answer the aliquot sum of the positive integer _n_,
the sum of all proper divisors of _n_.

Aliquot sums,
threads over lists,
OEIS [A001065](https://oeis.org/A001065):

```
>>> 1:23.aliquotSum
[
	0 1 1 3 1 6 1 7 4 8
	1 16 1 10 9 15 1 21 1 22
	11 14 1
]

>>> 25.aliquotSum
6
```

Record positions of aliquot sums,
OEIS [A034090](https://oeis.org/A034090):

```
>>> 1:100.aliquotSum.recordPositions
[
	 1  2  4  6  8 10 12 18 20 24
	30 36 48 60 72 84 90 96
]
```

Record values of aliquot sums,
OEIS [A034091](https://oeis.org/A034091):

```
>>> 1:100.aliquotSum.recordValues
[
	  0   1   3   6   7
	  8  16  21  22  36
	 42  55  76 108 123
	140 144 156
]
```

Numbers whose sum of proper (or aliquot) divisors is a prime,
OEIS [A037020](https://oeis.org/A037020):

```
>>> 1:100.select { :n |
>>> 	n.aliquotSum.isPrime
>>> }
[
	 4  8 21 27 32 35 39 50 55 57
	63 65 77 85 98
]
```

Aliquot sums,
OEIS [A001065](https://oeis.org/A001065):

~~~spl svg=A
1:119.aliquotSum.linePlot
~~~

![](sw/spl/Help/Image/aliquotSum-A.svg)

Record positions of aliquot sums,
OEIS [A034090](https://oeis.org/A034090):

~~~spl svg=B
1:250.aliquotSum
.recordPositions
.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSum-B.svg)

Record values of aliquot sums,
OEIS [A034091](https://oeis.org/A034091):

~~~spl svg=C
1:250.aliquotSum
.recordValues
.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSum-C.svg)

First differences of aliquot sums,
OEIS [A053246](https://oeis.org/A053246):

~~~spl svg=D oeis=A053246 signed
2:115.aliquotSum.differences
.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSum-D.svg)

Second differences of aliquot sums,
OEIS [A053246](https://oeis.org/A053246):

~~~spl svg=E oeis=A053246 signed
1:115.aliquotSum.differences(2)
.discretePlot
~~~

![](sw/spl/Help/Image/aliquotSum-E.svg)

Prefix sum of aliquot sums,
OEIS [A153485](https://oeis.org/A153485):

~~~spl svg=F
1:65.aliquotSum.prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/aliquotSum-F.svg)

* * *

See also: aliquotSequence, divisorSigma, isAbundantNumber, unitaryDivisorSigma

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RestrictedDivisorFunction.html),
_OEIS_
[1](https://oeis.org/A001065),
_W_
[1](https://en.wikipedia.org/wiki/Aliquot_sum)
