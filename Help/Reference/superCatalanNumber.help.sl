# superCatalanNumber

- _superCatalanNumber(n)_

The super Catalan numbers count the number of lattice paths with diagonal steps from _(n,n)_ to _(0,0)_,
which do not touch the diagonal line _x=y_.

The first ten super Catalan numbers:

```
>>> 1:10.collect(superCatalanNumber:/1)
[1 1 3 11 45 197 903 4279 20793 103049]
```

The twenty-fourth super Catalan number:

```
>>> 24.superCatalanNumber
1416461675464871
```

* * *

See also: catalanNumber, memoize

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SuperCatalanNumber.html),
_OEIS_
[1](https://oeis.org/A001003)
[2](https://oeis.org/A006318),
_W_
[1](https://en.wikipedia.org/wiki/Schr%C3%B6der%E2%80%93Hipparchus_number)
