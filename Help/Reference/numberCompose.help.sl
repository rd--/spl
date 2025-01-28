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
>>> [1 3 46 40].numberCompose([86400 3600 60 1])
100000
```

Compose exact numbers:

```
>>> [1 3 2/3 3].numberCompose([10 5 2 1])
88/3

>>> [1 1.pi 1.e].numberCompose([5 2 1])
5 + 2.pi + 1.e
```

Compose inexact numbers:

```
>>> [2.1 4 1.34].numberCompose([5 2 1])
19.84
```

The basic operation of `numberDecompose` is `dot`:

```
>>> let c = [5 1 2 1.32];
>>> let u = [10 5 2 1];
>>> (c.numberCompose(u), c.dot(u))
(60.32, 60.32)
```

If the list of coefficients is shorter than the list of units, the former is left padded with zeros:

```
>>> [5 1 2 1.32].numberCompose([500 200 10 5 2 1])
60.32
```

`fromDms` is a special case of `numberCompose`:

```
>>> [24 37 31.44].fromDms
24.6254

>>> [24 37 31.44].numberCompose([1 1/60 1/3600])
24.6254
```

* * *

See also: *, dot, inner, numberDecompose, sum

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NumberCompose.html)
