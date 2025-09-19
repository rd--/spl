# memoize

- _memoize(f:/1, requireImmediate)_

Answer a one argument `Block` that memoizes the unary block _f_,
using a `Map` if _requireImmediate_ is `true`,
else a `Dictionary`.

Un-memoized Fibonacci may take several seconds to evaluate for _k > 30_:

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

* * *

See also: Block, cached, fibonacci

Guides: Block Functions, Dictionary Functions

References:
_Python_
[1](https://docs.python.org/3/library/functools.html#functools.cache)
