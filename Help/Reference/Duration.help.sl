# Duration

- _Duration(s)_

A `Type` to represent an interval of time.
The base unit of time in the International System of Units (SI) is the second.

```
>>> Duration(90)
1.5.minutes.asDuration
```

Query Duration values:

```
>>> 3.minutes.asDuration.seconds
180

>>> 3.hours.asDuration.minutes
180

>>> 3.days.asDuration.hours
72

>>> 3.weeks.asDuration.days
21
```

Durations can be summed,
either with durations or temporal `Quantity` values:

```
>>> 3.weeks.asDuration + 4.days
25.days.asDuration
```

A `Duration` can be parsed from a `String` in ISO-8601 format using `parseDuration`:

```
>>> 'P3W4D'.parseDuration
(3.weeks + 4.days).asDuration
```

* * *

See also: asSeconds, Date, Frequency, parseDuration, TimeStamp

Categories: Temporal, Type
