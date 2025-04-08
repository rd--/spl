# hours

- _hours(t)_

At `SmallFloat` answer a `Quantity` value:

```
>>> 3.hours
Quantity(3 * 60 * 60, 'seconds')

>>> 3.hours
180.minutes
```

At `Time`,
answer the number of complete hours:

```
>>> 180.minutes.asTime.hours
3

>>> 3.days.asTime.hours
72
```

* * *

See also: milliseconds, minutes, seconds, Time

References:
_Smalltalk_
5.8.2.11

Categories: Time, Type
