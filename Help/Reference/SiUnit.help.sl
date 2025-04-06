# SiUnit

- _SiUnit(symbol, name, dimension, quantity)_

A `Type` representing a standard unit of measurement defined by the International System of Units (SI).
Each unit is for a quantity defined by the International System of Quantities.

The base unit of length is the _metre_:

```
>>> 'm'.siUnit
SiUnit('m', 'metre', 'L', 'length')
```

The base unit of time is the _second_:

```
>>> 's'.siUnit
SiUnit('s', 'second', 'T', 'time')
```

The base unit of mass is the _kilogram_:

```
>>> 'kg'.siUnit
SiUnit('kg', 'kilogram', 'M', 'mass')
```

The derived unit of frequency is the _hertz_:

```
>>> 'Hz'.siUnit
SiUnit('Hz', 'hertz', 'f', 'frequency')
```

The derived unit of plane angle is the _radian_:

```
>>> 'rad'.siUnit
SiUnit('rad', 'radian', nil, 'plane angle')
```

* * *

See also: Frequency, Length, Mass, PlaneAngle, SiPrefix, Time
