# mixedFractionParts

- _mixedFractionParts(aNumber)_

Answer a two element list of the _integerPart_ and the _fractionPart_ of _aNumber_.

Separate the integer and fractional parts of a real number:

```
>>> 2.7.mixedFractionParts
[2 0.7]
```

Separate an improper fraction into an integer and a proper fraction:

```
>>> 14/3.mixedFractionParts
[4 2/3]
```

Inexact numbers:

```
>>> (1.pi ^ 20).mixedFractionParts
[8769956796 0.08269]
```

Threads elementwise over lists:

```
>>> [2.4 2.5 2.6].mixedFractionParts
[2 0.4; 2 0.5; 2 0.6]
```

Negative numbers:

```
>>> [-2.4 -2.5 -3.0].mixedFractionParts
[-2 -0.4; -2 -0.5; -3 0]
```

Complex numbers:

```
>>> (17 / 1J3).mixedFractionParts
[1J-5 0.7J-0.1]
```

* * *

See also: fractionalPart, integerPart

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MixedFractionParts.html)

Categories: Querying
