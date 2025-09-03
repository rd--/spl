# TimeStamp

- _TimeStamp(n)_

`TimeStamp` is a `Type` representing a zero duration point in time,
also called a time instant,
represented as the signed number of seconds from 1 January, 1970.

Make a time stamp:

```
>>> TimeStamp(0)
>>> .dateAndTimeString
'1970-01-01T00:00:00.000Z'

>>> TimeStamp(1.75E9)
>>> .dateAndTimeString
'2025-06-15T15:06:40.000Z'
```

The `System` method `now` gets the current time:

```
>>> system.now.isTimeStamp
true
```

* * *

See also: asTimeStamp, dateAndTimeString, Date, Duration, Time, TimeInterval, now

Guides: Date and Time Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Timestamp)

Categories: Time, Type
