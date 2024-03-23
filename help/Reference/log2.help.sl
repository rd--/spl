# log2

- _log2(aNumber)_

The base two logarithm of _aNumber_.

```
>>> (2 ^ 10).log2
10

>>> 2.sqrt.log2
1/2

>>> let n = system.nextRandomFloat;
>>> n.log2
(n.log / 2.log)
```

Log base two of the first primes:

```
>>> 10.primesList.log2
[1 1.585 2.322 2.8074 3.4594 3.7004 4.0875 4.248 4.524 4.858]
```

Plot over a subset of the reals:

~~~
(0.01, 0.02 .. 5).log2.plot
~~~

* * *

See also: log, log10

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Log2.html),
_Xenharmonic_
[1](https://en.xen.wiki/w/Log2)
