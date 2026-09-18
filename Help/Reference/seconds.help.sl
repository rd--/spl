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
use `inSeconds` to answer the number of seconds:

```
>>> 3.hours.inSeconds
10800

>>> 3.minutes.inSeconds
180

>>> 365.25.days.inSeconds
31557600
```

* * *

See also: hours, inSeconds, milliseconds, minutes, Quantity

Guides: Quantity Functions

References:
_Smalltalk_
5.8.2.17

Unicode: U+2033 ″Double Prime

Categories: Time, Type
