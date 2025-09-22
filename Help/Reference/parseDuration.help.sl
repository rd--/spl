# parseDuration

- _parseDuration(s, f₀)_

Parse the ISO-8601 duration string _s_ and answer a `Duration` value.
An optional error handler can be specified.

Three days and four hours:

```
>>> 'P3DT4H'.parseDuration
(3.days + 4.hours).asDuration
```

Four days, twelve hours, thirty minutes, and five seconds:

```
>>> 'P4DT12H30M5S'.parseDuration
[
	4.days,
	12.hours,
	30.minutes,
	5.seconds
].sum.asDuration

>>> 'P4DT12H30M5S'
>>> .parseDuration
>>> .asList
[4 12 30 5]
```

Five minutes and seven and one half seconds:

```
>>> 'PT5M7.5S'.parseDuration
Duration((5 * 60) + 7.5)

>>> 'PT5M7.5S'.parseDuration.asList
[0 0 5 7.5]
```

Six weeks,
weeks should not be combined with any other unit:

```
>>> 'P6W'.parseDuration
Duration(6 * 7 * 24 * 60 * 60)

>>> 'P6W'.parseDuration.asList
[42 0 0 0]
```

On parse failure:

```
>>> '3D'.parseDuration { nil }
nil

>>> {
>>> 	'3M'.parseDuration
>>> }.hasError
true
```

_Note_:
At `parseDuration` it is an `error` if the year or month fields are non-zero.
Such duration values would represent differing absolute time intervals depending on the start time,
as the number of days in a calendar year and calendar month are variable.
To work with such values see `CalendarDuration`.

* * *

See also: CalendarDuration, Date, Duration, parseDate, TimeStamp

Guides: Date and Time Functions, Parsing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601#Durations)

Categories: Time
