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
use `inHours` to answer the number of hours:

```
>>> (3 * 60 * 60).seconds.inHours
3

>>> 180.minutes.inHours
3

>>> 45.minutes.inHours
0.75

>>> 3.days.inHours
72
```

* * *

See also: milliseconds, minutes, Quantity, seconds

Guides: Quantity Functions

References:
_Smalltalk_
5.8.2.11

Categories: Time, Type
