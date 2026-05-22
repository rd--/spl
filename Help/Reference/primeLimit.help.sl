# primeLimit

- _primeLimit(n/d)_

Answer the largest prime number that is a factor of the fraction _n/d_.

The five-smooth numbers,
OEIS [A051037](https://oeis.org/A051037):

```
>>> 1:15.select { :each |
>>> 	each.primeLimit <= 5
>>> }
[1 2 3 4 5 6 8 9 10 12 15]
```

The greatest prime dividing _n_,
threads elementwise over lists,
OEIS [A006530](https://oeis.org/A006530):

```
>>> 2:15.primeLimit
[2 3 2 5 3 7 2 3 5 11 3 13 7 5]
```

At zero and one:

```
>>> [0 1].primeLimit
[0 0]
```

The greatest prime dividing _n_,
OEIS [A006530](https://oeis.org/A006530):

~~~spl svg=A oeis=A006530
2:72.primeLimit.linePlot
~~~

![](Help/Image/primeLimit-A.svg)

At `RatioTuning`:

```
>>> RatioTuning[1 8/7 4/3 14/9 16/9]
>>> .primeLimit
7
```

* * *

See also: primeFactors, RatioTuning

Guides: Prime Number Functions, Scale Functions, Tuning Functions

Categories: Arithmetic, Primes
