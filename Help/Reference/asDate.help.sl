# asDate

- _asDate(x)_

Convert the object _x_ into a `Date` value.

At `Number`,
answer the `Date` that is the specified number of seconds after 1 January, 1970:

```
>>> 0.asDate.dateString
'1970-01-01'

>>> (3 * 365.4 * 24 * 60 * 60)
>>> .asDate
>>> .dateString
'1973-01-01'
```

At `TimeStamp` convert to an equivalent `Date` value:

```
>>> TimeStamp(0)
>>> .asDate
>>> .dateString
'1970-01-01'
```

At `Date` answer the identity:

```
>>> '1970-01-01'
>>> .parseDate
>>> .asDate
>>> .dateString
'1970-01-01'
```

* * *

See also: asDateAndTime, Date, DateAndTime, Duration, Time, TimeStamp

Guides: Date and Time Functions

Categories: Converting, Time
