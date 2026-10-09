# CalendarDuration

- _CalendarDuration([Y, M, D, h, m, s])_

A `Type` to represent an interval of time specified as a list _(years, months, days, hours, minutes, seconds)_.
The duration represented is relative, not absolute.

Ninety seconds:

```
>>> CalendarDuration[
>>> 	0000 00 00 00 01 30
>>> ].durationString
'P0Y0M0DT0H1M30S'
```

Seventeen days, five hours, eleven minutes and seventeen seconds:

```
>>> CalendarDuration[
>>> 	0000 00 17 05 11 17
>>> ].durationString
'P0Y0M17DT5H11M17S'
```

A `CalendarDuration` can be parsed from a `String` in ISO-8601 format using `parseCalendarDuration`:

```
>>> 'P25D'.parseCalendarDuration
CalendarDuration[0 0 25 0 0 0]

>>> 'P3W4D'.parseCalendarDuration
CalendarDuration[0 0 25 0 0 0]
```

A `CalendarDuration` can be formatted as ISO-8601 using `durationString`:

```
>>> CalendarDuration[
>>> 	0000 00 25 00 00 00
>>> ].durationString
'P0Y0M25DT0H0M0S'
```

The `components` method answers the list _(years, months, days, hours, minutes, seconds)_:

```
>>> CalendarDuration[1 2 3 4 5 6]
>>> .components
[1 2 3 4 5 6]
```

Threads over lists:

```
>>> CalendarDuration[
>>> 	1 2 3 4 5 6;
>>> 	6 5 4 3 2 1
>>> ]
[
	CalendarDuration[1 2 3 4 5 6],
	CalendarDuration[6 5 4 3 2 1]
]
```

The `seconds` value may be fractional:

```
>>> 'PT3.141S'.parseCalendarDuration
CalendarDuration[0 0 0 0 0 3.141]
```

_Note_:
This value is a calendrical duration,
it only has an absolute duration in seconds in relation to a `Date` or `DateAndTime` value.

* * *

See also: Date, Duration, Frequency, inSeconds, parseCalendarDuration, TimeStamp

Guides: Date and Time Functions

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/calendarduration.html)

Categories: Temporal, Type
