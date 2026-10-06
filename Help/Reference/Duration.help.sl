# Duration

- _Duration(s)_
- _Duration(d, h, m, s)_

A `Type` to represent an interval of time,
specified either in seconds,
or as  _(days, hours, minutes, seconds)_.
The duration represented is absolute, not relative.

Ninety seconds:

```
>>> Duration(90)
1.5.minutes.Duration
```

Seventeen days, five hours, eleven minutes and seventeen seconds:

```
>>> Duration(17, 5, 11, 17)
Duration(1487477)
```

Nine days written three ways:

```
>>> Duration(9, 0, 0, 0)
Duration(777600)

>>> Duration(8, 24, 0, 0)
Duration(777600)

>>> Duration(0, 216, 0, 0)
Duration(777600)
```

Query the number of seconds a `Duration` represents:

```
>>> Duration(0, 0, 3, 0).seconds
180
```

Durations can be summed,
either with durations or temporal `Quantity` values:

```
>>> 3.weeks.Duration + 4.days
25.days.Duration
```

A `Duration` can be parsed from a `String` in ISO-8601 format using `parseDuration`:

```
>>> 'P3W4D'.parseDuration
(3.weeks + 4.days).Duration
```

A `Duration` can be formatted as ISO-8601 using `durationString`:

```
>>> Duration(25, 0, 0, 0)
>>> .durationString
'P25DT0H0M0S'
```

The `components` method answers the list _(days, hours, minutes, seconds)_:

```
>>> Duration(1487477).components
[17 5 11 17]

>>> Duration(777600).components
[9 0 0 0]
```

The `seconds` value may be fractional:

```
>>> 'PT3.141S'.parseDuration
Duration(3.141)

>>> Duration(0, 0, 0, 3.141)
Duration(3.141)

>>> Duration(3.141).seconds
3.141
```

At `Frequency`,
answer the reciprocal:

```
>>> Frequency(100).Duration
Duration(0.01)
```

The inverse is `Frequency`:

```
>>> Duration(0.01).Frequency
Frequency(100)
```

_Note_:
This value is not a calendrical duration,
it is not possible to specify months or years or decades or centuries and so forth.

* * *

See also: CalendarDuration, Date, Frequency, TimeStamp, inSeconds, parseDuration

Guides: Date and Time Functions

Categories: Temporal, Type
