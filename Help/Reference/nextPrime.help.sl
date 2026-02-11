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
[3 5 5 7]
```

At `Rational`:

```
>>> 7/2.floor.nextPrime
5
```

At non-integral `SmallFloat`:

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
>>> [1 5 10 15].nextPrime
[2 7 11 17]
```

First few terms,
OEIS [A151800](https://oeis.org/A151800):

```
>>> 0:23.nextPrime
[
	 2  2  3  5  5  7  7 11 11 11
	11 13 13 17 17 17 17 19 19 23
	23 23 23 29
]
```

Approximation to `prime`:

```
>>> 1.nextPrime(25)
97

>>> 25 * 25.log
80.4719
```

Smallest prime _>n^2_,
OEIS [A007491](https://oeis.org/A007491):

```
>>> (1:23 ^ 2).nextPrime
[
	  2   5  11  17  29
	 37  53  67  83 101
	127 149 173 197 227
	257 293 331 367 401
	443 487 541
]
```

Least positive _m_ such that _n!+m_ is prime,
OEIS [A033932](https://oeis.org/A033932):

```
>>> 0:13.!.collect { :n |
>>> 	n.nextPrime - n
>>> }
[1 1 1 1 5 7 7 11 23 17 11 1 29 67]
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

Plot sequence of _p_ where _a(n)_ is the smallest prime _q_ so that _n=(p+1)/(q+1)_ with _p_ prime,
OEIS [A062251](https://oeis.org/A062251):

~~~spl svg=C
1:137.collect { :n |
	let q = 2;
	let r = nil;
	{
		r := n * (q + 1) - 1;
		r.isPrime
	}.whileFalse {
		q := q.nextPrime
	};
	r
}.scatterPlot
~~~

![](sw/spl/Help/Image/nextPrime-C.svg)

Plot the difference between the next prime of _n²_ and _n²_,
OEIS [A053000](https://oeis.org/A053000):

~~~spl svg=D
0:200.collect { :n |
	let m = n.square;
	m.nextPrime - m
}.scatterPlot
~~~

![](sw/spl/Help/Image/nextPrime-D.svg)

* * *

See also: isPrime, previousPrime

Guides: Prime Number Functions

References:
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=nextprime),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NextPrime.html),
_OEIS_
[1](https://oeis.org/A062251)
[2](https://oeis.org/A053000),
_Python_
[1](https://docs.sympy.org/latest/modules/ntheory.html#sympy.ntheory.generate.nextprime)

Categories: Arithmetic
