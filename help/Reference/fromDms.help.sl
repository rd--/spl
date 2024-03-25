# fromDms

- _fromDms(degrees, minutes, seconds)_

Answer angle in decimal degrees.

```
>>> [30 10 4].fromDms
30.1678

>>> [27 12 3.45].fromDms
27.201

>>> [27 12 345/100].fromDms
652823/24000

>>> [20 10 12].fromDms
20.17
```

A signed angle:

```
>>> [-27 -12 -3.45].fromDms
-27.201
```

* * *

See also: numberCompose

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromDMS.html)
