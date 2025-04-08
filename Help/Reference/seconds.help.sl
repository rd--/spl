# seconds

- _seconds(t)_

At `SmallFloat`,
answer a `Quantity` value holding _t_ seconds:

```
>>> 3.seconds
Quantity(3, 'seconds')

>>> 180.seconds
3.minutes
```

At `Time`,
answer the number of seconds:

```
>>> 3.hours.asTime.seconds
10800

>>> Time(5).seconds
5
```

* * *

See also: asSeconds, hours, milliseconds, minutes, Time

References:
_Smalltalk_
5.8.2.17

Categories: Time, Type
