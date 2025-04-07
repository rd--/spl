# asTimeStamp

- _asTimeStamp(aNumber)_

Answer a `TimeStamp` holding the time given by taking `aNumber` as the number of milliseconds since the Unix epoch (1970-01-01).

```
>>> 0.asTimeStamp.iso8601
'1970-01-01T00:00:00.000Z'

>>> (50 * 365.24 * 24 * 60 * 60 * 1000)
>>> .asTimeStamp
>>> .iso8601
'2020-01-01T00:00:00.000Z'
```

* * *

See also: Date, Duration, iso8601, now, TimeStamp

Categories: Time, Type
