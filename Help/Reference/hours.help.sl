# hours

- _hours(t)_

At `SmallFloat` answer a `Quantity` value:

```
>>> 3.hours
Quantity(3 * 60 * 60, 'seconds')

>>> 3.hours
180.minutes
```

At `Quantity`,
answer the number of complete hours:

```
>>> (3 * 60 * 60).seconds.hours
3

>>> 180.minutes.hours
3

>>> 3.days.hours
72
```

* * *

See also: milliseconds, minutes, Quantity, seconds

References:
_Smalltalk_
5.8.2.11

Categories: Time, Type
