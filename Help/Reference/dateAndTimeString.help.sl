# dateAndTimeString

- _dateAndTimeString(t)_

Answers a `String` that formats the temporal object _t_ according to the ISO-8601 standard.

At `DateAndTime`:

```
>>> DateAndTime([1970 01 01 00 00 00.000])
>>> .dateAndTimeString
'1970-01-01T00:00:00.000Z'
```

The inverse is `parseDateAndTime`,
answering a `DateAndTime` value:

```
>>> '2025-04-08T19:45:00.000Z'
>>> .parseDateAndTime
DateAndTime([2025 04 08 19 45 00.000])
```

At `TimeStamp`:

```
>>> TimeStamp(0)
>>> .dateAndTimeString
'1970-01-01T00:00:00.000Z'
```

The inverse at `TimeStamp` is `parseTimeStamp`,
answering a `TimeStamp` value:

```
>>> '2025-04-08T19:45:00.000Z'
>>> .parseTimeStamp
TimeStamp(1744141500)
```

* * *

See also: Date, dateString, parseDate, parseDuration, TimeStamp

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DateString.html),
_W_
[1](https://en.wikipedia.org/wiki/ISO_8601)

Categories: Time
