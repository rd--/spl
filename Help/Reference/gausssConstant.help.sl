# gausssConstant

- _gausssConstant(n)_

Answer _n_ times Gauss’s constant _G_,
the reciprocal of the arithmetic-geometric mean of 1 and √2.

```
>>> 1.gausssConstant
0.834627

>>> 1 / 1.arithmeticGeometricMean(2.sqrt)
0.834627
```

Relation to `gamma`:

```
>>> (2.pi ^ -1.5) * (gamma(0.25) ^ 2)
0.834627
```

Lemniscate constant:

```
>>> 1.gausssConstant * 1.pi
1.lemniscateConstant
```

Continued fraction:

```
>>> 1.gausssConstant
>>> .continuedFraction(16)
[0 1 5 21 3 4 14 1 1 1 1 1 3 1 15 1]
```

Multiplicative inverse:

```
>>> (1 / 1.gausssConstant)
1.198140

>>> (1 / 1.gausssConstant)
>>> .continuedFraction(15)
[1 5 21 3 4 14 1 1 1 1 1 3 1 15 1]
```

Ubiquitous constant:

```
>>> (1 / 1.gausssConstant) / 2.sqrt
0.847213
```

* * *

See also: arithmeticGeometricMean, lemniscateConstant, sqrt

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GausssConstant.html)
[2](https://mathworld.wolfram.com/UbiquitousConstant.html),
_OEIS_
[1](https://oeis.org/A053002)
[2](https://oeis.org/A053003)
[3](https://oeis.org/A014549)
