# isDurationString

- _isDurationString(aString)_

Answer `true` if _aString_ is an ISO-8601 duration string,
else `false`.

Three days and four hours:

```
>>> 'P3DT4H'.isDurationString
true
```

Four days, twelve hours, thirty minutes, and five seconds:

```
>>> 'P4DT12H30M5S'.isDurationString
true
```

Five minutes and seven and one half seconds:

```
>>> 'PT5M7.5S'.isDurationString
true
```

Six weeks,
weeks should not be combined with any other unit:

```
>>> 'P6W'.isDurationString
true
```

* * *

See also: Date, DateAndTime, Duration, parseDuration, TimeStamp

Guides: Date and Time Functions, Parsing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601#Durations)

Categories: Time
