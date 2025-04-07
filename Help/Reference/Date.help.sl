# Date

`Date` is `Type` representing a date and time.

A `Date` can be read from a `String` using `parseDate`.

```
>>> let date = '2024-03-04'.parseDate;
>>> (
>>> 	date.year,
>>> 	date.month,
>>> 	date.dayOfMonth
>>> )
(2024, 3, 4)
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
>>> let d = 0.asDate;
>>> [d.year, d.month, d.dayOfMonth]
[1970 1 1]
```

The first six of these are answered by `asList`:

```
>>> '2025-04-07T17:07:20'
>>> .parseDate
>>> .asList
[2025 4 2 17 7 20]
```

* * *

See also: asDate, dayOfMonth, Duration, hour, minute, month, now, parseDate, second, TimeStamp, year

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DateObject.html),
_Smalltalk_
5.8.1

Categories: Time, Type
