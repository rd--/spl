# DateAndTime

- _Date([y, m, d, h, m, s])_

`DateAndTime` is `Type` representing a date and time.

Construct a _UTC_ date,
the month and day of month fields are _one-indexed_:

```
>>> DateAndTime(
>>> 	[2025 04 08 07 30 00.000]
>>> ).dateAndTimeString
'2025-04-08T07:30:00.000Z'
```

The current date and time can be read from the `System` as a `TimeStamp` using `now`,
and translated into a `DateAndTime` using `asDateAndTime`:

```
>>> system
>>> .currentDateAndTime
>>> .year >= 2024
true

>>> system
>>> .now
>>> .asDateAndTime
>>> .year >= 2024
true
```

There are methods to access the elements of the date,
i.e. `year`, `month`, `dayOfMonth`, `hour`, `minute`, `second`:

```
>>> let d = DateAndTime(
>>> 	[1970, 01, 01, 00, 00, 00.000]
>>> );
>>> [
>>> 	d.year,
>>> 	d.month,
>>> 	d.dayOfMonth,
>>> 	d.hour,
>>> 	d.minute,
>>> 	d.second
>>> ]
[1970 01 01 00 00 00.000]
```

These fields are answered by `asList`:

```
>>> '2025-04-08T17:07:20.500Z'
>>> .parseDateAndTime
>>> .asList
[2025 04 08 17 07 20.500]
```

To convert a `DateAndTime` value to the number of seconds from 1 January, 1970 use `absoluteTime`:

```
>>> '2025-05-04T08:09:57.505+10:00'
>>> .parseDateAndTime
>>> .absoluteTime
1746310197.505
```

* * *

See also: absoluteTime, asDateAndTime, dayOfMonth, Date, Duration, hour, minute, month, now, parseDate, second, TimeStamp, year

Guides: Date and Time Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DateObject.html),
_Smalltalk_
5.8.1

Categories: Time, Type
