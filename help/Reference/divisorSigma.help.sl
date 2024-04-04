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

DivisorSigma works over integers:

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
((2 * (-1 + (2 * 2.sqrt))) / ((-1 + 2.sqrt) * (-1 + 3.sqrt)))
```

Threads elementwise over lists:

```
>>> 2.divisorSigma(1:5)
[1 5 10 21 26]
```

Recognize perfect numbers, numbers _n_ such that the sum of their divisors is equal to _2n_:

```
>>> 1:30.select { :n | 1.divisorSigma(n) = (2 * n) }
[6 28]
```

Deficient numbers, numbers _n_ such that the sum of their divisors is smaller than _2n_:

```
>>> 1:30.select { :n | 1.divisorSigma(n) < (2 * n) }
[1 2 3 4 5 7 8 9 10 11 13 14 15 16 17 19 21 22 23 25 26 27 29]
```

Abundant numbers, numbers _n_ such that the sum of their divisors is greater than _2n_:

```
>>> 1:30.select { :n | 1.divisorSigma(n) > (2 * n) }
[12 18 20 24 30]
```

Plot divisorSigma:

~~~
0.divisorSigma(1:50).plot

1.divisorSigma(1:50).plot

2.divisorSigma(1:50).plot
~~~

* * *

See also: divisible, divisors, eulerPhi

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DivisorFunction.html)
[2](https://reference.wolfram.com/language/ref/DivisorSigma.html)
