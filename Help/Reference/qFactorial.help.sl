# qFactorial

- _qFactorial(n, q)_

In the unary case answer the _q_-factorial polynomial for _n_.
In the binary case evaluate it at _q_.

The first few terms:

```
>>> 1.qFactorial
Polynomial([1])

>>> 2.qFactorial
Polynomial([1 1])

>>> 3.qFactorial
Polynomial([1 2 2 1])

>>> 4.qFactorial
Polynomial([1 3 5 6 5 3 1])

>>> 5.qFactorial
Polynomial([1 4 9 15 20 22 20 15 9 4 1])

>>> 6.qFactorial
Polynomial(
	[
		1 5 14 29 49 71 90 101
		101 90 71 49 29 14 5 1
	]
)
```

Specific values:

```
>>> 10.qFactorial(0.7)
7657.45

>>> 12.qFactorial(0.8)
1.08709E6
```

At `Fraction`:

```
>>> 1:4.collect { :n |
>>> 	n.qFactorial(1/2)
>>> }
[1 3/2 21/8 315/64]
```

Value at zero:

```
>>> 0.qFactorial(5)
1
```

* * *

See also: qBinomial, qPochhammer, UnivariatePolynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/q-Factorial.html)
[2](https://reference.wolfram.com/language/ref/QFactorial.html),
_W_
[1](https://en.wikipedia.org/wiki/Q-analog)
[2](https://en.wikipedia.org/wiki/Q-factorial)
