# divisorSigma

- _divisorSigma(k, n)_

Answer the divisor function _σk(n)_.

`divisorSigma` is also known as the divisor function or sum-of-divisors function.

_divisorSigma(k, n)_ is the sum of the _k_-th powers of the divisors of _n_.

Find the divisors of twenty:

```
>>> 20.divisors
[1 2 4 5 10 20]
```

The number of divisors:

```
>>> 0.divisorSigma(20)
6
```

The size of the `divisors` is equal to `divisorSigma` of `zero`:

```
>>> [60 1729 8640].collect { :each |
>>> 	[
>>> 		each.divisors.size,
>>> 		0.divisorSigma(each)
>>> 	]
>>> }
[12 12; 8 8; 56 56]
```

The sum of divisors:

```
>>> 1.divisorSigma(20)
42
```

The sum of squares of divisors:

```
>>> 2.divisorSigma(20)
546
```

At `Integer`:

```
>>> 2.divisorSigma(6)
50
```

Negative powers:

```
>>> -1.divisorSigma(12)
7/3

>>> -2.divisorSigma(10)
(13 / 10)
```

Rational powers:

```
>>> (1 / 2).divisorSigma(12)
(
	(2 * (-1 + (2 * 2.sqrt)))
	/
	((-1 + 2.sqrt) * (-1 + 3.sqrt))
)
```

Threads elementwise over lists:

```
>>> 0.divisorSigma(1:5)
[1 2 2 3 2]

>>> 1.divisorSigma(1:5)
[1 3 4 7 6]

>>> 2.divisorSigma(1:5)
[1 5 10 21 26]
```

OEIS [A000005](https://oeis.org/A000005):

```
>>> 0.divisorSigma(1:40)
[
	1 2 2 3 2 4 2 4 3 4
	2 6 2 4 4 5 2 6 2 6
	4 4 2 8 3 4 4 6 2 8
	2 6 4 4 4 9 2 4 4 8
]
```

Recognize perfect numbers, numbers _n_ such that the sum of their divisors is equal to _2n_:

```
>>> 1:30.select { :n |
>>> 	1.divisorSigma(n) = (2 * n)
>>> }
[6 28]
```

Deficient numbers, numbers _n_ such that the sum of their divisors is smaller than _2n_:

```
>>> 1:30.select { :n |
>>> 	1.divisorSigma(n) < (2 * n)
>>> }
[
	01 02 03 04 05 07 08 09 10 11
	13 14 15 16 17 19 21 22 23 25
	26 27 29
]
```

Abundant numbers, numbers _n_ such that the sum of their divisors is greater than _2n_:

```
>>> 1:30.select { :n |
>>> 	1.divisorSigma(n) > (2 * n)
>>> }
[12 18 20 24 30]
```

Calculate the divisor summatory function:

```
>>> 0.divisorSigma(1:39).foldList(0, +)
[
	  0   1   3   5   8
	 10  14  16  20  23
	 27  29  35  37  41
	 45  50  52  58  60
	 66  70  74  76  84
	 87  91  95 101 103
	111 113 119 123 127
	131 140 142 146 150
]
```

OEIS [A078923](https://oeis.org/A078923),
the complement is OEIS [A005114](https://oeis.org/A005114)
the nonaliquot numbers:

```
>>> let sigma:/1 = { :n |
>>> 	1.divisorSigma(n)
>>> }.memoize(true);
>>> 0:9.select { :n |
>>> 	let m = (n = 1).if { 2 } { (n - 1) ^ 2 };
>>> 	1:m.anySatisfy { :k |
>>> 		sigma(k) - k = n
>>> 	}
>>> }
[0 1 3 4 6 7 8 9]
```

Plot divisor function _σ₀(n)_ up to _n=100_:

~~~spl svg=A
1:100.functionPlot { :x |
	0.divisorSigma(x)
}
~~~

![](sw/spl/Help/Image/divisorSigma-A.svg)

Plot divisor function _σ₁(n)_ up to _n=100_:

~~~spl svg=B
1:100.functionPlot { :x |
	1.divisorSigma(x)
}
~~~

![](sw/spl/Help/Image/divisorSigma-B.svg)

Plot the log of the divisor function _σ₂(n)_ up to _n=100_:

~~~spl svg=C
1:100.functionPlot { :x |
	2.divisorSigma(x).log
}
~~~

![](sw/spl/Help/Image/divisorSigma-C.svg)

Scatter plot of _σ₀(n)_, also called _τ(n)_:

~~~spl svg=D
let n = 200;
0.divisorSigma(1:n).scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-D.svg)

* * *

See also: aliquotSum, divisible, divisors, divisorSum, divisorSummatoryFunction, eulerPhi, isAbundantNumber

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DivisorFunction.html)
[2](https://reference.wolfram.com/language/ref/DivisorSigma.html),
_OEIS_
[1](https://oeis.org/A000005)
[2](https://oeis.org/A000203)
[3](https://oeis.org/A078923)
[4](https://oeis.org/A005114),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.divisor_sigma),
_W_
[1](https://en.wikipedia.org/wiki/Divisor_function)
