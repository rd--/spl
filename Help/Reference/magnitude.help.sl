# magnitude

- _magnitude(q)_

Answer the amount of the specified `Quantity` _q_.

```
>>> 3.millimetres
Quantity(0.003, 'metres')
```

The quantity is in relation to the specified unit,
which is in all cases the base unit:

```
>>> 3.millimetres.magnitude
3E-3
```

* * *

See also: Quantity, unit

Guides: Quantity Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/QuantityMagnitude.html)
