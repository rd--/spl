# parseCalendarDuration

- _parseCalendarDuration(aString)_
- _parseCalendarDuration(aString, elseClause:/0)_

Parse an ISO-8601 duration string and answer a `CalendarDuration` value.

Three days and four hours:

```
>>> 'P3DT4H'.parseCalendarDuration
CalendarDuration([0 0 3 4 0 0])
```

Four days, twelve hours, thirty minutes, and five seconds:

```
>>> 'P4DT12H30M5S'.parseCalendarDuration
CalendarDuration([0 0 4 12 30 5])

>>> 'P4DT12H30M5S'
>>> .parseCalendarDuration
>>> .asList
[0 0 4 12 30 5]
```

Five minutes and seven and one half seconds:

```
>>> 'PT5M7.5S'.parseCalendarDuration
CalendarDuration([0 0 0 0 5 7.5])

>>> 'PT5M7.5S'.parseCalendarDuration.asList
[0 0 0 0 5 7.5]
```

Six weeks,
weeks should not be combined with any other unit:

```
>>> 'P6W'.parseCalendarDuration
CalendarDuration([0 0 42 0 0 0])

>>> 'P6W'.parseCalendarDuration.asList
[0 0 42 0 0 0]
```

On parse failure:

```
>>> '3D'.parseCalendarDuration { nil }
nil

>>> {
>>> 	'3M'.parseCalendarDuration
>>> }.ifError { true }
true
```

* * *

See also: Date, CalendarDuration, parseDate, TimeStamp

Guides: Date and Time Functions, Parsing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601#Durations)

Categories: Time
