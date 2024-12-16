# diracDelta

- _diracDelta(x, z)_
- _diracDelta(alpha)_ ⟹ _diracDelta(alpha, inf)_

Answer the Dirac delta function _δ(x)_,
which is _z_ at `zero`, and `z` elsewhere.

`diracDelta` vanishes for nonzero arguments:

```
>>> 1/2.diracDelta
0
```

`diracDelta` is _z_, or infinity, at zero:

```
>>> 0.diracDelta(1)
1

>>> 0.diracDelta
inf
```

* * *

See also: kroneckerDelta

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DeltaFunction.html),
[2](https://reference.wolfram.com/language/ref/DiracDelta)
