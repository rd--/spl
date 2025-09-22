# parseTime

- _parseTime(aString)_
- _parseTime(aString, elseClause:/0)_

Parse _aString_ as a `Time` value.
A string parser that recognizes a subset of the ISO-8601 specification,
specifically _hh:mm:ss.sss_.

```
>>> '10:41:00.001'
>>> .parseTime
Time(38460.001)

>>> (10 * 60 * 60) + (41 * 60) + 0.001
38460.001

>>> Time(38460.001).timeString
'10:41:00.001'
```

The fractional part of seconds can be elided:

```
>>> '07:50:53'
>>> .parseTime
Time(28253)

>>> (7 * 60 * 60) + (50 * 60) + 53
28253

>>> Time(28253).timeString
'07:50:53.000'
```

On parser failure:

```
>>> '09:46'.parseTime { nil }
nil

>>> {
>>> 	'09:46'.parseTime
>>> }.hasError
true
```

_Rationale_:
The `Time` type can represent any quantity of time in seconds.
The ISO-8601 time notation can only represent time up to twenty four hours.

* * *

See also: Date, parseDate, parseDateAndTime, parseDuration, timeString

Guides: Parsing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601)

Categories: Time, Parsing
