# nextPrime

- _nextPrime(n)_

Answer the least integer that is greater than _n_ and is prime.

```
>>> 3.nextPrime
5

>>> (2 ^ 6).nextPrime
67

>>> 31243.nextPrime
31247

>>> 17393.nextPrime
17401

>>> 2971215073.nextPrime
2971215083

>>> 2971215083.isPrime
true
```

Find twin primes, i.e. pairs of primes of the form _(p, p + 2)_:

```
>>> 1:100.select { :n |
>>> 	n.isPrime & {
>>> 		n.nextPrime = (n + 2)
>>> 	}
>>> }
[3 5 11 17 29 41 59 71]
```

It is conjectured that for any integer _n_, there is a prime _p_ with _n < p < 2 * n_:

```
>>> 2:200.allSatisfy { :n |
>>> 	let p = n.nextPrime;
>>> 	p < (n * 2)
>>> }
true
```

Plot the sequence of primes:

~~~spl svg=A
0:50.functionPlot(nextPrime:/1)
~~~

![](sw/spl/Help/Image/nextPrime-A.svg)

* * *

See also: isPrime, previousPrime

Guides: Prime Number Functions

References:
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=nextprime),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NextPrime.html)

Categories: Arithmetic
