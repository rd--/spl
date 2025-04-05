# Quantity

- _Quantity(magnitude, unit)_

A `Type` that represents a quantity with size _magnitude_ and the specified _unit_.

A Quantity represents a value associated with a specific unit:

```
>>> 8.metres
Quantity(8, 'metres')

>>> 30.kilograms
Quantity(30, 'kilograms')
```

Time quantity constructors:

```
>>> 3.centiseconds
30.milliseconds

>>> 3.seconds
300.centiseconds

>>> 3.minutes
180.seconds

>>> 3.hours
180.minutes

>>> 3.days
72.hours

>>> 3.weeks
21.days
```

Calendrical units:

```
>>> 1.siderealMonths
27.3217.days

>>> 1.synodicMonths
29.5306.days

>>> 1.julianYears
365.25.days
```

Length quantity constructors:

```
>>> 3.metres
300.centimetres

>>> 30.millimetres
3.centimetres

>>> 3.nanometres
Quantity(3E-9, 'metres')
```

Non-SI length constructors:

```
>>> 3.feet
Quantity(0.9144, 'metres')

>>> 3.feet
0.9144.metres
```

* * *

See also: Mass, Length, Time

Guides: Quantity Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Quantity.html)
