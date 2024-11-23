# Duration

A `Type` to represent an interval of time.
The base unit of time in the International System of Units (SI) is the second.

Durations are constructed from `Number` values using the methods `milliseconds`, `centiseconds`, `seconds`, `minutes`, `hours`, `days`, `weeks`:

```
>>> 3.centiseconds
30.milliseconds

>>> 3.seconds
300.centiseconds

>>> 3.minutes
180.seconds

>>> 3.hours
180.minutes

>>> 3.days
72.hours

>>> 3.weeks
21.days
```

There are also calendrical units `siderealMonths`, `synodicMonths` and `julianYears`:

```
>>> 1.siderealMonths
27.3217.days

>>> 1.synodicMonths
29.5306.days

>>> 1.julianYears
365.25.days
```

Durations are queried using the same methods:

```
>>> 3.minutes.seconds
180

>>> 3.hours.minutes
180

>>> 3.days.hours
72

>>> 3.weeks.days
21
```

Durations can be summed:

```
>>> 3.weeks + 4.days
25.days
```

A `Duration` can be parsed from a `String` in ISO-8601 format using `parseDuration`:

```
>>> 'P3W4D'.parseDuration
3.weeks + 4.days
```

* * *

See also: asSeconds, Date, Frequency, parseDuration, TimeStamp

Categories: Temporal, Type
