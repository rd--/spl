# Date

- _Date([y, m, d])_

`Date` is `Type` representing a date in the Gregorian calendar.

Construct a `Date` value from a `List`,
the month and day of month fields are _one-indexed_:

```
>>> Date([2025 04 08])
>>> .dateString
'2025-04-08'
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
>>> let d = Date([1970, 01, 01]);
>>> [d.year, d.month, d.dayOfMonth]
[1970 1 1]
```

These fields are answered by `asList`:

```
>>> '2025-04-08'
>>> .parseDate
>>> .asList
[2025 04 08]
```

* * *

See also: absoluteTime, asDate, dayOfMonth, DateAndTime, Duration, hour, minute, month, now, parseDate, second, TimeStamp, year

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DateObject.html),
_Smalltalk_
5.8.1

Categories: Time, Type
