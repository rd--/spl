# fineStructureConstant

- _fineStructureConstant(n)_

Answer _n_ times the fine-structure constant,
usually written as α,
also known as the Sommerfeld constant,
a fundamental physical constant.

```
>>> 1 / 1.fineStructureConstant
137.036
```

Definition in terms of four other physical constants:

```
>>> 1.fineStructureConstant
0.007297

>>> let h = 1.planckConstant;
>>> let e = 1.elementaryCharge;
>>> let c = 1.speedOfLight;
>>> let e0 = 1.electricConstant;
>>> e.square / (2 * e0 * h * c)
0.007297
```

Approximations to the inverse fine-structure constant:

```
>>> 1 / 7/3000.pi
136.41

>>> 1 / 1/432.pi
137.51

>>> 360 / 1.goldenRatio.square
137.51
```

Stanbury:

```
>>> UnivariatePolynomial([0 1 1 4])
>>> .at(1.pi)
137.036
```

* * *

See also: electricConstant, elementaryCharge, planckConstant, speedOfLight

Guides: Mathematical Constants

References:
_W_
[1](https://en.wikipedia.org/wiki/Fine-structure_constant)

Further Reading: Stanbury 1983
