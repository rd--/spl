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

At `Quantity`,
answer the number of seconds:

```
>>> 3.hours.seconds
10800

>>> 3.minutes.seconds
180

>>> 365.25.days.seconds
31557600
```

* * *

See also: asSeconds, hours, milliseconds, minutes, Quantity

Guides: Quantity Functions

References:
_Smalltalk_
5.8.2.17

Categories: Time, Type
