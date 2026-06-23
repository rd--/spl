# memoize

- _memoize(f:/n, requireImmediate)_

Answer an _n_ argument `Block` that memoizes the _n_-ary block _f_,
using a `Map` if _requireImmediate_ is `true`,
else a `Dictionary`.
Implemented for _n=0,1,2_.

Un-memoized Fibonacci may take several seconds to evaluate for _k>30_:

```
>>> let f = { :n |
>>> 	(n < 2).if {
>>> 		n
>>> 	} {
>>> 		f(n - 1) + f(n - 2)
>>> 	}
>>> };
>>> f(15)
610
```

Memoized Fibonacci will answer immediately for large _k_:

```
>>> let f:/1 = { :n |
>>> 	(n < 2).if {
>>> 		n
>>> 	} {
>>> 		f(n - 1) + f(n - 2)
>>> 	}
>>> }.memoize(false);
>>> f(170L)
150804340016807970735635273952047185L
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

Memoize a no-argument block:

~~~spl svg=A
let r = Sfc32(673821);
(
	{
		{
			r.nextRandomFloat
		}.memoize ! 8
	} ! 16
).catenate.stepPlot
~~~

![](Help/Image/memoize-A.svg)

* * *

See also: Block, cached, fibonacci

Guides: Block Functions, Dictionary Functions

References:
_OEIS_
[1](https://oeis.org/A004001)
[2](https://oeis.org/A002083),
_Python_
[1](https://docs.python.org/3/library/functools.html#functools.cache)
