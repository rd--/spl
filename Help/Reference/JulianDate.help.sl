# JulianDate

- _JulianDate(year, month, day)_

Answer a `Date` value representing the specified Julian date.

```
>>> JulianDate(-4713, 11, 24)
Date(-4713, 10, 17)
```

The inverse is `julianDate`:

```
>>> Date(-4713, 10, 17).julianDate
[-4713 11 24]
```

The translation is in terms of `julianDay`:

```
>>> JulianDate(-4713, 11, 24)
>>> .julianDay
-38

>>> Date(-4713, 10, 17)
>>> .julianDay
-38

>>> -38.fromJulianDay
Date(-4713, 10, 17)

>>> JulianDate(-3101, 02, 17)
Date(-3101, 1, 22)

>>> Date(-3101, 1, 22)
>>> .julianDate
[-3101 02 17]

>>> JulianDate(-3101, 02, 17)
>>> .julianDay
588_465
```

* * *

See also: Date, julianDay

Guides: Date and Time Functions
