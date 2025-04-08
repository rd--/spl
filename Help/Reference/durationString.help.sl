# durationString

- _durationString(aDuration)_

Answer the ISO-8601 duration string for _aDuration_.

Three days and four hours:

```
>>> Duration(273600)
>>> .durationString
'P0W3DT4H0M0S'
```

Four days, twelve hours, thirty minutes, and five seconds:

```
>>> Duration(390605)
>>> .durationString
'P0W4DT12H30M5S'
```

Five minutes and seven and one half seconds:

```
>>> Duration(307.5)
>>> .durationString
'P0W0DT0H5M7.5S'
```

Six weeks:

```
>>> Duration(3628800)
>>> .durationString
'P6W0DT0H0M0S'
```

Two weeks, three days, five hours, eleven minutes and seventeen seconds:

```
>>> Duration([2 3 5 11 17])
>>> .durationString
'P2W3DT5H11M17S'
```

This format is recognised by `parseDuration`:

```
>>> 'P0W4DT12H30M5S'.parseDuration
Duration(390605)
```

* * *

See also: Date, dateString, dateTimeString, Duration, ordinalDateString

References:
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601)
