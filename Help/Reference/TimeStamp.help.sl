# TimeStamp

- _TimeStamp(t)_

`TimeStamp` is a `Type` representing a zero duration point in time.
The _epoch_ is the Unix-Epoch:

```
>>> TimeStamp(0).dateTimeString
'1970-01-01T00:00:00.000Z'
```

The `System` method `now` gets the current time.

```
>>> system.now.isTimeStamp
true
```

The `SmallFloat` method `asTimeStamp` given a Unix-Epoch time in milliseconds,
i.e. the number of milliseconds since the Unix epoch (1970-01-01).

```
>>> 1.75E9.asTimeStamp.dateTimeString
'2025-06-15T15:06:40.000Z'
```

* * *

See also: asTimeStamp, Date, Duration, now

Categories: Time, Type
