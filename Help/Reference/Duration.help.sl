# Duration

- _Duration(s)_
- _Duration([w, d, h, m, s])_

A `Type` to represent an interval of time,
specified either in seconds,
or as a list _(weeks, days, hours, minutes, seconds)_.

Ninety seconds:

```
>>> Duration(90)
1.5.minutes.asDuration
```

Two weeks, three days, five hours, eleven minutes and seventeen seconds:

```
>>> Duration([2 3 5 11 17])
Duration(1487477)
```

Nine days written three ways:

```
>>> Duration([0 9 0 0 0])
Duration(777600)

>>> Duration([1 2 0 0 0])
Duration(777600)

>>> Duration([0 0 216 0 0])
Duration(777600)
```

Query `Duration` values:

```
>>> Duration(180).seconds
180
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

A `Duration` can be formatted as ISO-8601 using `durationString`:

```
>>> Duration([3 4 0 0 0])
>>> .durationString
'P3W4DT0H0M0S'
```

The `asList` method answers the list _(weeks, days, hours, minutes, seconds)_:

```
>>> Duration(1487477).asList
[2 3 5 11 17]

>>> Duration(777600).asList
[1 2 0 0 0]
```

_Note_:
This value is not a calendrical duration,
it is not possible to specify months or years or decades or centuries and so forth.

* * *

See also: asSeconds, Date, Frequency, parseDuration, TimeStamp

Categories: Temporal, Type
