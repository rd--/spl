# SiUnit

- _SiUnit(name, symbol, quantity, dimension)_

A `Type` representing a standard unit of measurement defined by the International System of Units (SI).
Each unit is for a quantity defined by the International System of Quantities.

The base unit of length is the _metre (m)_:

```
>>> 'm'.siUnit
SiUnit('metre', 'm', 'length', 'L')

>>> let m = 'metre'.siUnit;
>>> (
>>> 	m.name,
>>> 	m.symbol,
>>> 	m.quantity,
>>> 	m.dimension
>>> )
('metre', 'm', 'length', 'L')

>>> 'm'.isBaseUnit
true
```

The base unit of time is the _second (s)_:

```
>>> 's'.siUnit
SiUnit('second', 's', 'time', 'T')

>>> 'second'.siUnit
SiUnit('second', 's', 'time', 'T')

>>> 's'.isBaseUnit
true
```

The base unit of mass is the _kilogram (kg)_:

```
>>> 'kg'.siUnit
SiUnit('kilogram', 'kg', 'mass', 'M')

>>> 'kilogram'.siUnit
SiUnit('kilogram', 'kg', 'mass', 'M')

>>> 'kg'.isBaseUnit
true
```

The base unit of electric current is the _ampere (A)_:

```
>>> 'A'.siUnit
SiUnit('ampere', 'A', 'electric current', 'I')
```

The base unit of thermodynamic temperature is the _kelvin (K)_:

```
>>> 'K'.siUnit
SiUnit(
	'kelvin',
	'K',
	'thermodynamic temperature',
	'Θ'
)
```

The base unit of the amount of substance is the _mole (mol)_:

```
>>> 'mol'.siUnit
SiUnit(
	'mole',
	'mol',
	'amount of substance',
	'N'
)
```

The derived unit of frequency is the _hertz (Hz)_:

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

The derived unit of plane angle is the _radian (rad)_:

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

The derived unit of force is the _newton (N)_:

```
>>> 'N'.siUnit
SiUnit(
	'newton',
	'N',
	['force' 'weight'],
	['F' 'W']
)
```

The derived unit of energy is the _joule (J)_:

```
>>> 'J'.siUnit
SiUnit(
	'joule',
	'J',
	['energy' 'work' 'heat'],
	['E' 'W' 'Q']
)
```

The derived unit of power is the _watt (W)_:

```
>>> 'W'.siUnit
SiUnit(
	'watt',
	'W',
	['power' 'radiant flux'],
	['P' 'Φe']
)
```

The derived unit of pressure is the _pascal (Pa)_:

```
>>> 'Pa'.siUnit
SiUnit(
	'pascal',
	'Pa',
	['pressure' 'stress'],
	['p' 'σ']
)
```

The derived unit of electrical potential difference is the _volt (V)_:

```
>>> 'V'.siUnit
SiUnit(
	'volt',
	'V',
	'electric potential difference',
	'V'
)
```

* * *

See also: Frequency, Length, Mass, PlaneAngle, Quantity, siUnit, Time

Guides: SI Units

References:
_NIST_
[1](https://www.nist.gov/pml/special-publication-811),
_W_
[1](https://en.wikipedia.org/wiki/International_System_of_Units)
