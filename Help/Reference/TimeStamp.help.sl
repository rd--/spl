# TimeStamp

`TimeStamp` is a `Type` representing a zero duration point in time.

The `System` method `now` gets the current time.

```
>>> system.now.isTimeStamp
true
```

The `SmallFloat` method `asTimeStamp` given a unix time in milliseconds,
i.e. the number of milliseconds since the Unix epoch (1970-01-01).

```
>>> 0.asTimeStamp.iso8601
'1970-01-01T00:00:00.000Z'
```

* * *

See also: asTimeStamp, Date, Duration, now

Categories: Time, Type
