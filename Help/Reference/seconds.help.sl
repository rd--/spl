# seconds

- _seconds(t)_

At `SmallFloat` answer a `Quantity` value holding _t_ seconds:

```
>>> 3.seconds
Quantity(3, 'seconds')

>>> 180.seconds
3.minutes
```

At `Duration`,
answer the number of second:

```
>>> 3.hours.asDuration.seconds
10800

>>> Duration(5).seconds
5
```

* * *

See also: asSeconds, Duration, hours, milliseconds, minutes

References:
_Smalltalk_
5.8.2.17

Categories: Time, Type
