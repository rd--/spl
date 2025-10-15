# nextPrime

- _nextPrime(n, k=1)_

Answer the least integer that is greater than _n_ and is prime.
In the binary case answer the _k_-th next, or previous, prime.

At `SmallFloat`:

```
>>> 3.nextPrime
5

>>> 10.nextPrime
11

>>> (2 ^ 6).nextPrime
67

>>> 31243.nextPrime
31247

>>> 17393.nextPrime
17401

>>> 2338714.nextPrime
2338717

>>> 2971215073.nextPrime
2971215083

>>> 2971215083.isPrime
true
```

At `LargeInteger`:

```
>>> [2L 3L 4L 5L].collect(nextPrime:/1)
[2 5 5 7]
```

At `Rational`:

```
>>> 7/2.floor.nextPrime
5
```

At `SmallFloat`:

```
>>> 100.5.nextPrime
101
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

Compute the last prime before 50:

```
>>> 50.nextPrime(-1)
47

>>> 50.previousPrime
47
```

Compute the second prime after 50:

```
>>> 50.nextPrime(2)
59

>>> 50.nextPrime.nextPrime
59
```

Threads over lists:

```
>>> 1:9.nextPrime
[2 3 5 5 7 7 11 11 11]

>>> [1 5 10 15].nextPrime
[2 7 11 17]
```

Approximation to `prime`:

```
>>> 1.nextPrime(25)
97

>>> 25 * 25.log
80.4719
```

Plot the sequence of primes:

~~~spl svg=A
0:50.functionPlot(nextPrime:/1)
~~~

![](sw/spl/Help/Image/nextPrime-A.svg)

Plot differences between _bⁿ_ and it’s next prime:

~~~spl svg=B
let b = 2;
0:40.collect { :n |
	let x = b ^ n;
	x.nextPrime - x
}.stepPlot
~~~

![](sw/spl/Help/Image/nextPrime-B.svg)

* * *

See also: isPrime, previousPrime

Guides: Prime Number Functions

References:
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=nextprime),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NextPrime.html)

Categories: Arithmetic
