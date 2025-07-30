# asTimeStamp

- _asTimeStamp(x)_

At `DateAndTime`,
converts to an equivalent `TimeStamp` value:

```
>>> '2025-04-07T21:32:00.000Z'
>>> .parseDateAndTime
>>> .asTimeStamp
TimeStamp(1744061520)
```

The inverse is `asDateAndTime`:

```
>>> TimeStamp(1744061520)
>>> .asDateAndTime
>>> .dateAndTimeString
'2025-04-07T21:32:00.000Z'
```

At `Number`,
call `TimeStamp`:

```
>>> 0.asTimeStamp.dateAndTimeString
'1970-01-01T00:00:00.000Z'

>>> 0.asTimeStamp
TimeStamp(0)

>>> (50 * 365.24 * 24 * 60 * 60)
>>> .asTimeStamp
>>> .dateAndTimeString
'2020-01-01T00:00:00.000Z'
```

The inverse is `absoluteTime`:

```
>>> TimeStamp(0).absoluteTime
0
```

* * *

See also: absoluteTime, Date, Duration, dateAndTimeString, now, TimeStamp

Categories: Time, Type
