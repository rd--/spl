# isSuperparticular

- _isSuperparticular(aFraction)_

Answer `true` if _aFraction_ is a superparticular ratio, else `false`.

A superparticular, or epimoric ratio, is the ratio of two consecutive integer numbers.

```
>>> 2/1.isSuperparticular
true

>>> 2/3.isSuperparticular
false

>>> 2:9.r(1:8).allSatisfy(isSuperparticular:/1)
true

>>> 2:9.r(1:8).ratioToCents.rounded
[1200 702 498 386 316 267 231 204]
```

The ratio between two successive superparticular ratios is always superparticular:

```
>>> 23/22 / 22/21
483/484
```

The ratio between two successive members of the Farey sequence is superparticular:

```
>>> let f = 6.fareySequence;
>>> (2 .. f.size - 1).collect { :i | f[i + 1] / f[i] }
[6/5 5/4 4/3 6/5 5/4 6/5 10/9 9/8 16/15 25/24 6/5]
```

* * *

See also: Fraction, isSquareSuperparticular

References:
_W_
[1](https://en.wikipedia.org/wiki/Superparticular_ratio),
_Xenharmonic_
[1](https://en.xen.wiki/w/Superparticular_ratio)
