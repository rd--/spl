# unit

- _unit(q)_

Answer the unit of the specified quantity _q_.

```
>>> 2.seconds.unit
'second'

>>> 3.kilograms.unit
'kilogram'
```

The specified unit is in all cases the base unit,
the conversion is made by the constructor function:

```
>>> 3.millimetres
Quantity(0.003, 'metre')

>>> 3.millimetres.unit
'metre'
```

Threads over lists:

```
>>> [5.hertz 0.2.seconds].unit
['hertz' 'second']
```

* * *

See also: Quantity

Guides: Quantity Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/QuantityUnit.html)
