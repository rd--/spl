# unit

- _unit(aQuantity)_

Answer the unit of the specified quantity.

```
>>> 3.millimetres
Quantity(0.003, 'metres')
```

The specified unit is in all cases the base unit,
the conversion is made by the constructor funtion:

```
>>> 3.millimetres.unit
'metres'
```

* * *

See also: Quantity

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/QuantityUnit.html)
