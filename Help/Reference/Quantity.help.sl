# Quantity

- _Quantity(magnitude, unit)_

A `Type` that represents a quantity with size _magnitude_ and the specified _unit_.
Units are specified according to the _International System of Units_.

A Quantity represents a value associated with a specific unit:

```
>>> 8.metres
Quantity(8, 'metres')

>>> 30.kilograms
Quantity(30, 'kilograms')
```

Predicates:

```
>>> 3.centimetres.isLength
true

>>> 3.hours.isTime
true

>>> 7.grams.isMass
true

>>> 48.kilohertz.isFrequency
true
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

Calendrical time units:

```
>>> 1.siderealMonths
27.3217.days

>>> 1.synodicMonths
29.5306.days

>>> 1.solarMonths
27.3216.days

>>> 1.anomalisticMonths
27.5546.days

>>> 1.julianYears
365.25.days
```

Frequencies are constructed from `Number` values using the methods `hertz`, `kilohertz` and `megaherz`:

```
>>> 3000.hertz
3.kilohertz
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

Mass quantity constructors:

```
>>> 1000.grams
1.kilograms

>>> 0.25.kilograms
250.grams
```

Non-SI mass constructors:

```
>>> 35.ounces
0.9922.kilograms

>>> 2.pounds
0.9072.kilograms
```

* * *

See also: Frequency, Mass, PlaneAngle, Length, SiUnit, Time

Guides: Quantity Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Quantity.html),
_NIST_
[1](https://www.nist.gov/pml/special-publication-811)
