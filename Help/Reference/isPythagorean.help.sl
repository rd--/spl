# isPythagorean

- _isPythagorean(t)_

Answer `true` if the tuning _t_ has prime limit of three.

The following tuning is Pythagorean:

```
>>> [486 512 576 648 729 768 864]
>>> .asRatioTuning
>>> .isPythagorean
true
```

Also implemented at `Fraction`,
a ratio is Pythagorean if the greatest prime factor is less than or equal to three:

```
>>> [
>>> 	1/1 256/243 32/27 4/3
>>> 	3/2 128/81 16/9 2/1
>>> ].allSatisfy(isPythagorean:/1)
true

>>> [
>>> 	1/1 256/243 32/27 4/3
>>> 	3/2 128/81 16/9 2/1
>>> ].collect(primeLimit:/1)
[0 3 3 3 3 3 3 2]
```

* * *

See also: greatestPrimeFactor, primeLimit, RatioTuning

Guides: Tuning Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Pythagorean_tuning)

Categories: Testing, Tuning
