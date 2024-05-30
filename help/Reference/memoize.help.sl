# memoize

- _memoize(aBlock:/1)_

Answer a one argument `Block` that memoizes _aBlock_ using a `Map`.

Un-memoized Fibonacci may take several seconds to evaluate for _k > 30_:

```
>>> let fib = { :n | (n < 2).if { n } { fib(n - 1) + fib(n - 2) } };
>>> let k = 15;
>>> fib(k)
610
```

Memoized Fibonacci will answer immediately for large _k_:

```
>>> let fib = { :n | (n < 2).if { n } { fib . (n - 1) + fib . (n - 2) } }.memoize;
>>> let k = 200n;
>>> fib . (k)
280571172992510140037611932413038677189525n
```

* * *

See also: Block, fibonacci
