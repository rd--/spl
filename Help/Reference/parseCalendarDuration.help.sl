# parseCalendarDuration

- _parseCalendarDuration(s, f₀)_

Parse the ISO-8601 duration string _s_ and answer a `CalendarDuration` value.
An optional error handler can be specified.

Three days and four hours:

```
>>> 'P3DT4H'.parseCalendarDuration
CalendarDuration([0 0 3 4 0 0])
```

Four days, twelve hours, thirty minutes, and five seconds:

```
>>> 'P4DT12H30M5S'
>>> .parseCalendarDuration
CalendarDuration([0 0 4 12 30 5])

>>> 'P4DT12H30M5S'
>>> .parseCalendarDuration
>>> .components
[0 0 4 12 30 5]
```

Five minutes and seven and one half seconds:

```
>>> 'PT5M7.5S'.parseCalendarDuration
CalendarDuration([0 0 0 0 5 7.5])

>>> 'PT5M7.5S'
>>> .parseCalendarDuration
>>> .components
[0 0 0 0 5 7.5]
```

Six weeks,
weeks should not be combined with any other unit:

```
>>> 'P6W'.parseCalendarDuration
CalendarDuration([0 0 42 0 0 0])

>>> 'P6W'.parseCalendarDuration
>>> .components
[0 0 42 0 0 0]
```

On parse failure:

```
>>> '3D'.parseCalendarDuration { nil }
nil

>>> {
>>> 	'3M'.parseCalendarDuration
>>> }.hasError
true
```

* * *

See also: Date, CalendarDuration, parseDate, parseDuration, TimeStamp

Guides: Date and Time Functions, Parsing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601#Durations)

Categories: Time
