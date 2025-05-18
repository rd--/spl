# weilHeight

- _weilHeight(n/d)_

Answer twice `log2` of the maximum of the `numerator` _n_ and `denominator` _d_ of the specified fraction.

```
>>> 81/64.weilHeight
12.68

>>> 81.log2 * 2
12.68
```

Threads over lists:

```
>>> [6/4 4/3 9/8].weilHeight
[3.17 4 6.34]
```

* * *

See also: tenneyHeight

Guides: Xenharmonic Functions
