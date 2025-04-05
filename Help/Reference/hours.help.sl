# hours

- _hours(t)_

At `SmallFloat` answer a `Quantity` value:

```
>>> 3.hours
Quantity(3 * 60 * 60, 'seconds')

>>> 3.hours
180.minutes
```

At `Duration`,
answer the number of complete hours:

```
>>> 180.minutes.asDuration.hours
3

>>> 3.days.asDuration.hours
72
```

* * *

See also: Duration, milliseconds, minutes, seconds

References:
_Smalltalk_
5.8.2.11

Categories: Time, Type
