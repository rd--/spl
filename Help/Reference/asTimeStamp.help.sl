# asTimeStamp

- _asTimeStamp(anObject)_

At `Date`,
converts to an equivalent `TimeStamp` value:

```
>>> '2025-04-07T21:32:00.000Z'
>>> .parseDateAndTime
>>> .asTimeStamp
TimeStamp(1744061520)
```

The inverse is `asDate`:

```
>>> TimeStamp(1744061520)
>>> .asDate
>>> .dateTimeString
'2025-04-07T21:32:00.000Z'
```

At `Number`,
call `TimeStamp`:

```
>>> 0.asTimeStamp.dateTimeString
'1970-01-01T00:00:00.000Z'

>>> 0.asTimeStamp
TimeStamp(0)

>>> (50 * 365.24 * 24 * 60 * 60)
>>> .asTimeStamp
>>> .dateTimeString
'2020-01-01T00:00:00.000Z'
```

The inverse is `absoluteTime`:

```
>>> TimeStamp(0).absoluteTime
0
```

* * *

See also: absoluteTime, Date, Duration, dateTimeString, now, TimeStamp

Categories: Time, Type
