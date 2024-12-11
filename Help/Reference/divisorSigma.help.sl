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
>>> 2.divisorSigma(1:5)
[1 5 10 21 26]
```

OEIS entry _A000005_:

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

Plot divisor function _σ₀(n)_ up to _n = 100_:

~~~spl svg=A
1:100.functionPlot { :x |
	0.divisorSigma(x)
}
~~~

![](sw/spl/Help/Image/divisorSigma-A.svg)

Plot divisor function _σ₁(n)_ up to _n = 100_:

~~~spl svg=B
1:100.functionPlot { :x |
	1.divisorSigma(x)
}
~~~

![](sw/spl/Help/Image/divisorSigma-B.svg)

Plot the log of the divisor function _σ₂(n)_ up to _n = 100_:

~~~spl svg=C
1:100.functionPlot { :x |
	2.divisorSigma(x).log
}
~~~

![](sw/spl/Help/Image/divisorSigma-C.svg)

* * *

See also: divisible, divisors, divisorSum, eulerPhi

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DivisorFunction.html)
[2](https://reference.wolfram.com/language/ref/DivisorSigma.html),
_OEIS_
[1](https://oeis.org/A000005),
_W_
[1](https://en.wikipedia.org/wiki/Divisor_function)
