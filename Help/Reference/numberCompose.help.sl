# numberCompose

- _numberCompose(aSequence, anotherSequence)_

The `sum` of the element-wise `*` of two sequences.

Add different denominations of money:

```
>>> let c = [5 1 2 1.32];
>>> let u = [10 5 2 1];
>>> (c.numberCompose(u), (c * u).sum)
(60.32, 60.32)
```

Add amounts of days, hours, minutes, and seconds to return seconds:

```
>>> let c = [1 3 46 40];
>>> let u = [86400 3600 60 1];
>>> c.numberCompose(u)
100000
```

Compose exact numbers:

```
>>> let c = [1 3 2/3 3];
>>> let u = [10 5 2 1];
>>> c.numberCompose(u)
88/3

>>> let c = [1 1.pi 1.e];
>>> let u = [5 2 1];
>>> c.numberCompose(u)
5 + 2.pi + 1.e
```

Compose inexact numbers:

```
>>> let c = [2.1 4 1.34];
>>> let u = [5 2 1];
>>> c.numberCompose(u)
19.84
```

The basic operation of `numberDecompose` is `dot`:

```
>>> let c = [5 1 2 1.32];
>>> let u = [10 5 2 1];
>>> (c.numberCompose(u), c.dot(u))
(60.32, 60.32)
```

If the list of coefficients is shorter than the list of units,
the former is left padded with zeros:

```
>>> let c = [5 1 2 1.32];
>>> let u = [500 200 10 5 2 1];
>>> c.numberCompose(u)
60.32
```

`fromDms` is a special case of `numberCompose`:

```
>>> [24 37 31.44].fromDms
24.6254

>>> let c = [24 37 31.44];
>>> let u = [1 1/60 1/3600];
>>> c.numberCompose(u)
24.6254
```

`mixedRadixDecode` performs a `numberCompose` operation:

```
>>> 1E4.mixedRadixDecode([24 60 60])
[2 46 40]

>>> let u = [60 * 60, 60, 1];
>>> let c = [2 46 40];
>>> c.numberCompose(u)
1E4
```

* * *

See also: *, dot, inner, mixedRadixDecode, numberDecompose, sum

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NumberCompose.html)
