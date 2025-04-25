# asDate

- _asDate(anObject)_

At `Number`,
answer the `Date` that is the specified number of seconds after the Unix epoch:

```
>>> (9 * 60 * 60)
>>> .asDate
>>> .dateTimeString
'1970-01-01T09:00:00.000Z'
```

At `TimeStamp` convert to an equivalent `Date` value:

```
>>> TimeStamp(0)
>>> .asDate
>>> .dateTimeString
'1970-01-01T00:00:00.000Z'
```

At `Date` answer the identity:

```
>>> '1970-01-01T00:00:00.000Z'
>>> .parseDateAndTime
>>> .asDate
>>> .dateTimeString
'1970-01-01T00:00:00.000Z'
```

* * *

See also: Date, Duration, dateTimeString, TimeStamp

Categories: Converting, Time
