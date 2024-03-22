# weilHeight

- _weilHeight(aFraction)_

Answer twice `log2` of the maximum of `numerator` and `denominator`.

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
