# TimeStamp

- _TimeStamp(n)_

`TimeStamp` is a `Type` representing a zero duration point in time,
also called a time instant,
represented as the signed number of seconds from 1 January, 1970.

Make a time stamp:

```
>>> TimeStamp(0)
>>> .dateAndTimeString
'1970-01-01T00:00:00.000Z'

>>> (50 * 365.24 * 24 * 60 * 60)
>>> .TimeStamp
>>> .dateAndTimeString
'2020-01-01T00:00:00.000Z'

>>> TimeStamp(1.75E9)
>>> .dateAndTimeString
'2025-06-15T15:06:40.000Z'
```

Threads over lists:

```
>>> TimeStamp[1 3; 5 7]
[
	[
		TimeStamp(1),
		TimeStamp(3)
	],
	[
		TimeStamp(5),
		TimeStamp(7)
	]
]
```

The inverse is `absoluteTime`:

```
>>> TimeStamp(0).absoluteTime
0

>>> TimeStamp[1 3; 5 7].absoluteTime
[1 3; 5 7]
```

At `DateAndTime`,
converts to an equivalent `TimeStamp` value:

```
>>> '2025-04-07T21:32:00.000Z'
>>> .parseDateAndTime
>>> .TimeStamp
TimeStamp(1744061520)
```

The inverse is `DateAndTime`:

```
>>> TimeStamp(1744061520)
>>> .DateAndTime
>>> .dateAndTimeString
'2025-04-07T21:32:00.000Z'
```

The `System` method `now` gets the current time:

```
>>> system.now.isTimeStamp
true
```

* * *

See also: Date, Duration, Time, TimeInterval, dateAndTimeString, now

Guides: Date and Time Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Timestamp)

Categories: Time, Type
