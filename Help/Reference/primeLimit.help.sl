# primeLimit

- _primeLimit(aFraction | aTuning)_

Answer the largest prime number that is a factor of _aFraction_.

```
>>> 2:15.select { :each |
>>> 	each.primeLimit <= 5
>>> }
[2 3 4 5 6 8 9 10 12 15]
```

Threads elementwise over lists:

```
>>> 2:15.primeLimit
[2 3 2 5 3 7 2 3 5 11 3 13 7 5]
```

At zero and one:

```
>>> [0 1].primeLimit
[0 0]
```

Plot:

~~~spl svg=A
2:72.primeLimit.linePlot
~~~

![](sw/spl/Help/Image/primeLimit-A.svg)

* * *

See also: primeFactors

Categories: Arithmetic, Primes
