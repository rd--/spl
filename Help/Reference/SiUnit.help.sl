# SiUnit

- _SiUnit(name, symbol, quantity, dimension)_

A `Type` representing a standard unit of measurement defined by the International System of Units (SI).
Each unit is for a quantity defined by the International System of Quantities.

The base unit of length is the _metre_:

```
>>> 'm'.siUnit
SiUnit('metre', 'm', 'length', 'L')

>>> let m = 'metre'.siUnit;
>>> (m.name, m.symbol, m.quantity, m.dimension)
('metre', 'm', 'length', 'L')

>>> 'm'.isBaseUnit
true
```

The base unit of time is the _second_:

```
>>> 's'.siUnit
SiUnit('second', 's', 'time', 'T')

>>> 'second'.siUnit
SiUnit('second', 's', 'time', 'T')

>>> 's'.isBaseUnit
true
```

The base unit of mass is the _kilogram_:

```
>>> 'kg'.siUnit
SiUnit('kilogram', 'kg', 'mass', 'M')

>>> 'kilogram'.siUnit
SiUnit('kilogram', 'kg', 'mass', 'M')

>>> 'kg'.isBaseUnit
true
```

The derived unit of frequency is the _hertz_:

```
>>> 'Hz'.siUnit
SiUnit('hertz', 'Hz', 'frequency', 'f')

>>> 'hertz'.siUnit
SiUnit('hertz', 'Hz', 'frequency', 'f')

>>> 'Hz'.isBaseUnit
false

>>> 'Hz'.isDerivedUnit
true
```

The derived unit of plane angle is the _radian_:

```
>>> 'rad'.siUnit
SiUnit('radian', 'rad', 'plane angle', nil)

>>> 'radian'.siUnit
SiUnit('radian', 'rad', 'plane angle', nil)

>>> 'rad'.isBaseUnit
false

>>> 'rad'.isDerivedUnit
true
```

* * *

See also: Frequency, Length, Mass, PlaneAngle, Quantity, SiPrefix, Time

Guides: SI Units

References:
_NIST_
[1](https://www.nist.gov/pml/special-publication-811)
_W_
[1](https://en.wikipedia.org/wiki/International_System_of_Units)
