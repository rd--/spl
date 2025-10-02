# asDateAndTime

- _asDateAndTime(x)_

Convert the object _x_ into a `DateAndTime` value.

At `Number`,
answer the `DateAndTime` that is the specified number of seconds after 1 January, 1970:

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

See also: asDate, Date, DateAndTime, Duration, Time, TimeStamp

Guides: Date and Time Functions

Categories: Converting, Time
