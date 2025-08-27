# electricConstant

- _electricConstant(n)_

Answer _n_ times the electric constant ε0,
the absolute dielectric permittivity of classical vacuum.

```
>>> 1.electricConstant
8.85419E-12

>>> let c = 1.speedOfLight;
>>> let m = 1.magneticConstant;
>>> 1 / (m * c.square)
1.electricConstant

>>> let a = 1.fineStructureConstant;
>>> let c = 1.speedOfLight;
>>> let e = 1.elementaryCharge;
>>> let h = 1.planckConstant;
>>> (e ^ 2) / (2 * a * h * c)
1.electricConstant
```

* * *

See also: elementaryCharge, magneticConstant, speedOfLight

Guides: Mathematical Constants

References:
_W_
[1](https://en.wikipedia.org/wiki/Vacuum_permittivity)
