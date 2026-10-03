# Date

- _Date(y, m, d)_

`Date` is `Type` representing a date in the Gregorian calendar.

Construct a `Date` value,
the month and day of month fields are _one-indexed_:

```
>>> Date(2025, 04, 08)
>>> .dateString
'2025-04-08'
```

The year is absolute, not relative:

```
>>> Date(0003, 04, 05).year
0003
```

The year is given in astronomical year numbering,
`zero` is year `one` BCE, and so on:

```
>>> let a = Date(0000, 01, 01);
>>> let b = Date(0001, 01, 01);
>>> let c = a.absoluteTime;
>>> let d = b.absoluteTime;
>>> let e = c + (366 * 24 * 60 * 60);
>>> (c, d, d = e)
(
	-62_167_217_992,
	-62_135_595_592,
	true
)
```

A `Date` can be read from a `String` using `parseDate`,
the components can be accessed using `year` and `month` and `dayOfMonth`:

```
>>> let date = '2024-04-23'.parseDate;
>>> (
>>> 	date.year,
>>> 	date.month,
>>> 	date.dayOfMonth
>>> )
(2024, 04, 23)
```

The current date can be read from the `System` as a `TimeStamp` using `now`,
and translated into a `Date` using `asDate`:

```
>>> system.currentDate.year >= 2024
true

>>> system.now.asDate.year >= 2024
true
```

There are methods to access the elements of the date,
i.e. `year`, `month`, `dayOfMonth`:

```
>>> let d = Date[1970 01 01];
>>> [d.year, d.month, d.dayOfMonth]
[1970 1 1]
```

These fields are answered by `components`:

```
>>> '2025-04-08'
>>> .parseDate
>>> .components
[2025 04 08]
```

* * *

See also: absoluteTime, asDate, dayOfMonth, DateAndTime, Duration, hour, minute, month, now, parseDate, second, TimeStamp, year

Guides: Date and Time Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DateObject.html),
_Smalltalk_
5.8.1,
_W_
[1](https://en.wikipedia.org/wiki/Calendar_date)
[2](https://en.wikipedia.org/wiki/Astronomical_year_numbering)

Categories: Time, Type
