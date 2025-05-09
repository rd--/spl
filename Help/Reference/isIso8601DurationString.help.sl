# isIso8601DurationString

- _isIso8601DurationString(aString)_

Answer `true` if _aString_ is an ISO-8601 duration string,
else `false`.

Three days and four hours:

```
>>> 'P3DT4H'.isIso8601DurationString
true
```

Four days, twelve hours, thirty minutes, and five seconds:

```
>>> 'P4DT12H30M5S'.isIso8601DurationString
true
```

Five minutes and seven and one half seconds:

```
>>> 'PT5M7.5S'.isIso8601DurationString
true
```

Six weeks,
weeks should not be combined with any other unit:

```
>>> 'P6W'.isIso8601DurationString
true
```

* * *

See also: Date, DateAndTime, Duration, parseDuration, TimeStamp

Guides: Date and Time Functions, Parsing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601#Durations)

Categories: Time
