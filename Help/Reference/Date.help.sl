# Date

- _Date([y, m, d, h, m, s])_

`Date` is `Type` representing a date and time.

Construct a _UTC_ date,
the month and day of month fields are _one-indexed_:

```
>>> Date([2025 04 08 07 30 00])
>>> .dateTimeString
'2025-04-08T07:30:00.000Z'
```

A `Date` can be read from a `String` using `parseDate`.

```
>>> let date = '2024-04-23'.parseDate;
>>> (
>>> 	date.year,
>>> 	date.month,
>>> 	date.dayOfMonth
>>> )
(2024, 04, 23)
```

The current date and time can be read from the `System` as a `TimeStamp` using `now`,
and translated into a `Date` using `asDate`:

```
>>> let date = system.now.asDate;
>>> date.year >= 2024
true
```

There are methods to access the elements of the date,
i.e. `year`, `month`, `dayOfMonth`, `hour`, `minute`, `second`, `millisecond` &etc.

```
>>> let d = Date([1970, 01, 01, 00, 00, 00]);
>>> [d.year, d.month, d.dayOfMonth]
[1970 1 1]
```

The first six of these fields are answered by `asList`:

```
>>> '2025-04-08T17:07:20.000Z'
>>> .parseDate
>>> .asList
[2025 04 08 17 07 20]
```

* * *

See also: asDate, dayOfMonth, Duration, hour, minute, month, now, parseDate, second, TimeStamp, year

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DateObject.html),
_Smalltalk_
5.8.1

Categories: Time, Type
