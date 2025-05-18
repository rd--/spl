# oddLimit

- _oddLimit(n/d)_

Answer the odd limit of the fraction _n/d_.
If either the numerator _n_ or the denominator _d_ is even,
it is divided it by two until it is odd,
and the larger of the two odd numbers is the odd limit.

```
>>> 12/7.oddLimit
7
```

The `integerLimit` is the larger of the numerator and denominator:

```
>>> 12/7.integerLimit
12
```

The `oddLimitSet` is all of the fractions that are within the specified `oddLimit`:

```
>>> 5.oddLimitSet
[1/1 6/5 5/4 4/3 3/2 8/5 5/3]
```

* * *

See also: integerLimit, oddLimitSet, primeLimit

Guides: Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Odd_limit)

Categories: Tuning
