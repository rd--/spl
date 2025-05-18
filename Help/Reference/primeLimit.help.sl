# primeLimit

- _primeLimit(n/d)_

Answer the largest prime number that is a factor of the fraction _n/d_.

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

At `RatioTuning`:

```
>>> [1 8/7 4/3 14/9 16/9]
>>> .asRatioTuning
>>> .primeLimit
7
```

* * *

See also: primeFactors, RatioTuning

Guides: Prime Number Functions, Tuning Functions

Categories: Arithmetic, Primes
