# memoize

- _memoize(f:/1, requireImmediate)_

Answer a one argument `Block` that memoizes the unary block _f_,
using a `Map` if _requireImmediate_ is `true`,
else a `Dictionary`.

Un-memoized Fibonacci may take several seconds to evaluate for _k>30_:

```
>>> let fib = { :n |
>>> 	(n < 2).if {
>>> 		n
>>> 	} {
>>> 		fib(n - 1) + fib(n - 2)
>>> 	}
>>> };
>>> let k = 15;
>>> fib(k)
610
```

Memoized Fibonacci will answer immediately for large _k_:

```
>>> let fib:/1 = { :n |
>>> 	(n < 2).if {
>>> 		n
>>> 	} {
>>> 		fib(n - 1) + fib(n - 2)
>>> 	}
>>> }.memoize(false);
>>> let k = 200L;
>>> fib(k)
280571172992510140037611932413038677189525L
```

Narayana-Zidek-Capell numbers,
OEIS [A002083](https://oeis.org/A002083):

```
>>> let a:/1 = { :n |
>>> 	(n < 3).if {
>>> 		1
>>> 	} {
>>> 		(2 * a(n - 1))
>>> 		-
>>> 		((n % 2) * a(n // 2))
>>> 	}
>>> }.memoize;
>>> 1:14.collect(a:/1)
[1 1 1 2 3 6 11 22 42 84 165 330 654 1308]
```

Riordan numbers,
OEIS [A005043](https://oeis.org/A005043):

```
>>> let a:/1 = { :n |
>>> 	(n < 2).if {
>>> 		1 - n
>>> 	} {
>>> 		let p = 2 * a(n - 1);
>>> 		let q = 3 * a(n - 2);
>>> 		(n - 1) * (p + q) / (n + 1)
>>> 	}
>>> }.memoize(true);
>>> 0:17.collect(a:/1)
[
	1 0 1 1 3 6 15 36 91 232
	603 1585 4213 11298 30537
	83097 227475 625992
]
```

A Conway sequence,
OEIS [A004001](https://oeis.org/A004001):

~~~spl svg=A
let a:/1 = { :n |
	(n <= 2).if {
		1
	} {
		a(a(n - 1)) + a(n - a(n - 1))
	}
}.memoize(true);
1:75.collect(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/memoize-A.svg)

* * *

See also: Block, cached, fibonacci

Guides: Block Functions, Dictionary Functions

References:
_OEIS_
[1](https://oeis.org/A004001)
[2](https://oeis.org/A002083),
_Python_
[1](https://docs.python.org/3/library/functools.html#functools.cache)
