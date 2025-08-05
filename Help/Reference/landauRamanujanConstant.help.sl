# landauRamanujanConstant

- _landauRamanujanConstant(n)_

Answer _n_ times the Landau-Ramanujan constant _b_.

```
>>> 1.landauRamanujanConstant
0.764223

>>> 500.primesList.select { :p |
>>> 	(p % 4) = 1
>>> }.product { :p |
>>> 	(1 - (1 / (p ^ 2))) ^ 0.5
>>> } * 1/4.pi
0.764223
```

* * *

See also: log, sqrt

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Landau-RamanujanConstant.html),
_OEIS_
[1](https://oeis.org/A081760),
_W_
[1](https://en.wikipedia.org/wiki/Landau%E2%80%93Ramanujan_constant)
