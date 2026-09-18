# minutes

- _minutes(t)_

At `SmallFloat`,
answer a `Quantity` value:

```
>>> 9.minutes
Quantity(540, 'seconds')

>>> 5.minutes
(5 * 60).seconds
```

At `Quantity`,
use `inMinutes` to answer the number of minutes:

```
>>> 3.hours.inMinutes
180

>>> 2.days.inMinutes
2 * 24 * 60
```

* * *

See also: hours, milliseconds, Quantity, seconds

Guides: Quantity Functions

References:
_Smalltalk_
5.8.2.12

Unicode: U+2032 ′Prime

Categories: Time, Type
