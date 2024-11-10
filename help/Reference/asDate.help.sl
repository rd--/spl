# asDate

- _asDate(aNumber | aTimeStamp | aDate)_

In the `Number` case, answer the `Date` that is _aNumber_ of seconds after the Unix epoch.

```
>>> (9 * 60 * 60).asDate.iso8601
'1970-01-01T09:00:00.000Z'
```

Else convert a _aTimeStamp_ to an equivalent `Date`, or answer _aDate_.

```
>>> 0.asTimeStamp.asDate.iso8601
'1970-01-01T00:00:00.000Z'

>>> '1970-01-01T00:00:00.000Z'.parseDate.asDate.iso8601
'1970-01-01T00:00:00.000Z'
```

* * *

See also: Date, Duration, iso8601, TimeStamp

Categories: Time, Type
