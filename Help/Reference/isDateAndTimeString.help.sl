# isDateAndTimeString

- _isDateAndTimeString(aString)_

Answer `true` is _aString_ is a subset of the ISO-8601 format date and time string,
specifically _YYYY:MM:DD_ then T then _hh:mm:ss.sss_ then a time zone specifier,
else `false`.

The time must be specified to millisecond precision,
and the time-zone must be specified either as as _hh:mm_ or as _Z_:

```
>>> '2025-05-01T12:29:19.000Z'
>>> .isDateAndTimeString
true

>>> '2025-05-01T12:29:19.000+10:00'
>>> .isDateAndTimeString
true
```

`parseDateAndTime` will parse strings that answer `true` to `isDateAndTimeString`:

```
>>> '2025-05-01T12:29:19.000+10:00'
>>> .parseDateAndTime
DateAndTime([2025 05 01 02 29 19.000])
```

* * *

See also: Date, isBooleanString, isDecimalIntegerString, isFloatString, parseDate

Guides: Parsing Functions
