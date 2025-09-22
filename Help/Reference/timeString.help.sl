# timeString

- _timeString(t)_

Format the `Time` value _t_ as a subset of the ISO-8601 specification,
specifically _hh:mm:ss.sss_.

```
>>> Time(38460.001).timeString
'10:41:00.001'

>>> Time(28253).timeString
'07:50:53.000'
```

It is an `error` if the time cannot be represented in the ISO-8601 format:

```
>>> '23:59:59.999'.parseTime
Time(86399.999)

>>> Time(86399.999).timeString
'23:59:59.999'

>>> {
>>> 	Time(86400).timeString
>>> }.hasError
true
```

_Rationale_:
The `Time` type can represent any quantity of time in seconds.
The ISO-8601 time notation can only represent time up to twenty four hours.
The time string truncates the accuracy to one millisecond.

* * *

See also: isTimeString, parseTime, Time

Guides: Parsing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601)

Categories: Time, Parsing
