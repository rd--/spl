# Date

`Date` is `Type` representing a date and time.

A `Date` can be read from a `String` using `parseDate`.

```
>>> let date = '2024-03-04'.parseDate;
>>> (date.year, date.month, date.dayOfMonth)
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

* * *

See also: asDate, dayOfMonth, Duration, hour, minute, month, now, parseDate, second, TimeStamp, year

Categories: Time, Type
