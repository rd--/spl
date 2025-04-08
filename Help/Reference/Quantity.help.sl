# Quantity

- _Quantity(magnitude, unit)_

A `Type` that represents a quantity with size _magnitude_ and the specified _unit_.
Units are specified according to the _International System of Units_.

A Quantity represents a value associated with a specific unit:

```
>>> 8.metres
Quantity(8, 'metres')

>>> let q = 30.kilograms;
>>> (q.magnitude, q.unit)
(30, 'kilograms')
```

Quantities can be tested for equality:

```
>>> 1.5.miles = 7920.feet
true
```

Make a _temporal_ quantity using `milliseconds`,
the quantity is converted to be in the _base unit_ of the quantity:

```
>>> 250.milliseconds
Quantity(0.25, 'seconds')
```

Unit predicates:

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

Temporal quantity constructors:

```
>>> 1500.milliseconds
1.5.seconds

>>> 3.centiseconds
30.milliseconds

>>> 1.5.seconds
1500.milliseconds

>>> 3.seconds
300.centiseconds

>>> 60.seconds
1.minutes

>>> 3.minutes
180.seconds

>>> 3.hours
180.minutes

>>> 3.hours
10800.seconds

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

A month as defined with respect to the celestial sphere:

```
>>> 1.siderealMonths
27.3217.days
```

A month as defined with respect to the line joining the sun and earth:

```
>>> 1.synodicMonths
29.5306.days
```

Query temporal `Quantity` values:

```
>>> 3.hours.minutes
180

>>> 3.days.hours
72

>>> 3.weeks.days
21

>>> 1.siderealDays.hours
23.9345
```

Frequencies are constructed from `Number` values using the methods `hertz`, `kilohertz` and `megaherz`:

```
>>> 3000.hertz
3.kilohertz

>>> 44.1.kilohertz
44100.hertz
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

There are approximately twelve inches in a foot:

```
>>> 12.inches
1.feet
```

A nautical mile is defined in terms of metres:

```
>>> 1.nauticalMiles
1852.metres
```

A point is approximately four millimetres:

```
>>> 12.point
4.2336.millimetres
```

Twelve point is approximately a pica:

```
>>> 12.point
1.picas
```

Length equivalences:

```
>>> 1.astronomicalUnits
149597871.kilometres

>>> 1.astronomicalUnits
92955807.miles

>>> 1.lightYears
9460700000000.kilometres

>>> 1.lightYears
63241.astronomicalUnits

>>> 1.parsecs
3.2615.lightYears

>>> 1.parsecs
206266.astronomicalUnits

>>> 3000.picometres
3.nanometres
```

A point is approximately 1/72 of an inch:

```
>>> 12.point
(12 / 72).inches
```

There are three feet in a yard:

```
>>> 1.yards
3.feet
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

Comparing masses.
A kilogram is a thousand grams:

```
>>> 23.kilograms
23000.grams
```

Two and one-fifth pounds is approximately a kilogram:

```
>>> 2.2.pounds
997.9.grams
```

Thirty-six ounces are approximately a kilogram:

```
>>> 36.ounces
1020.58.grams
```

An ounce is 1/16 of a pound:

```
>>> (1 / 16).pounds
1.ounces
```

Multiplication of a quantity by a number:

```
>>> 3.minutes * 3
9.minutes
```

Division of a quantity by a number:

```
>>> 9.minutes / 3
3.minutes
```

Addition of commensurable quantities:

```
>>> 0.5.seconds + 750.milliseconds
1.25.seconds

>>> 0.25.seconds + 500.milliseconds
750.milliseconds

>>> 500.milliseconds + 0.25.seconds
0.75.seconds

>>> [
>>> 	2.days
>>> 	2.hours
>>> 	2.minutes
>>> 	2.seconds
>>> ].sum
[
	2 * 24 * 60 * 60,
	2 * 60 * 60,
	2 * 60,
	2
].sum.seconds
```

Subtraction of commensurable quantities:

```
>>> 2.weeks - 12.days
48.hours
```

Comparison of commensurable quantities:

```
>>> 2.minutes < 2.hours
true

>>> 2.hours > 2.minutes
true

>>> 48000.hertz < 96.kilohertz
true
```

Addition, subtraction and comparison:

```
>>> [
>>> 	27.days,
>>> 	7.hours,
>>> 	43.minutes,
>>> 	11.6.seconds
>>> ].sum - 1.siderealMonths < 1.seconds
true
```

* * *

See also: Frequency, Mass, PlaneAngle, Length, SiUnit, Time

Guides: Quantity Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Quantity.html),
_NIST_
[1](https://www.nist.gov/pml/special-publication-811)
