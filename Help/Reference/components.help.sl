# components

- _components(x)_

Answer a `List` of the components, or parts, of the object _x_.

At `Fraction`:

```
>>> 1/3.components
[1 3]

>>> 1/3.numeratorDenominator
[1L 3L]
```

At `Complex`:

```
>>> 1J3.components
[1 3]

>>> 1J3.realImaginary
[1 3]
```

At `Date`,
answer _(year, month, day)_:

```
>>> '2025-04-08'
>>> .parseDate
>>> .components
[2025 04 08]
```

At `DateAndTime`,
answer _(year, month, day, hour, minute, second)_:

```
>>> '2025-04-07T17:07:20.500Z'
>>> .parseDateAndTime
>>> .components
[2025 04 07 17 07 20.500]
```

At `Duration`,
answer _(days, hours, minutes, seconds)_:

```
>>> 'P4DT12H30M5S'
>>> .parseDuration
>>> .components
[4 12 30 5]
```

* * *

See also: Complex, Date, DateAndTime, Duration, Fraction, List

Guides: List Functions
