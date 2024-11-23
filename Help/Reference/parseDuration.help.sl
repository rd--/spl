# parseDuration

- _parseDuration(aString)_

Parse an ISO-8601 duration string.

```
>>> 'P3DT4H'.parseDuration
(3.days + 4.hours)
```

Four days, twelve hours, thirty minutes, and five seconds:

```
>>> 'P4DT12H30M5S'.parseDuration
4.days + 12.hours + 30.minutes + 5.seconds
```

It is an error if the year or month fields are non-zero,
since the duration is ambiguous regarding the total number of days in a calendar year and calendar month.

* * *

See also: Duration

References:
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601#Durations)

Categories: Time
