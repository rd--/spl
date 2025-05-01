# asDateAndTime

- _asDateAndTime(anObject)_

At `Number`,
answer the `DateAndTime` that is the specified number of seconds after January 1, 1970:

```
>>> (9 * 60 * 60)
>>> .asDateAndTime
>>> .dateAndTimeString
'1970-01-01T09:00:00.000Z'
```

At `TimeStamp` convert to an equivalent `Date` value:

```
>>> TimeStamp(0)
>>> .asDateAndTime
>>> .dateAndTimeString
'1970-01-01T00:00:00.000Z'
```

At `DateAndTime` answer the identity:

```
>>> '1970-01-01T00:00:00.000Z'
>>> .parseDateAndTime
>>> .asDateAndTime
>>> .dateAndTimeString
'1970-01-01T00:00:00.000Z'
```

* * *

See also: Date, DateAndTime, Duration, Time, TimeStamp

Guides: Date and Time Functions

Categories: Converting, Time
