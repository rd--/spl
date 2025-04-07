# asDate

- _asDate(anObject)_

At `Number`,
answer the `Date` that is the specified number of seconds after the Unix epoch:

```
>>> (9 * 60 * 60).asDate.iso8601
'1970-01-01T09:00:00.000Z'
```

At `TimeStamp` convert to an equivalent `Date` value:

```
>>> 0.asTimeStamp.asDate.iso8601
'1970-01-01T00:00:00.000Z'
```

At `Date` answer the identity:

```
>>> '1970-01-01T00:00:00.000Z'
>>> .parseDate
>>> .asDate
>>> .iso8601
'1970-01-01T00:00:00.000Z'
```

* * *

See also: Date, Duration, iso8601, TimeStamp

Categories: Converting, Time
