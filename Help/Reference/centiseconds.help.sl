# centiseconds

- _centiseconds(x)_

At `SmallFloat` answer a `Quantity` value:

```
>>> 1.centiseconds
Quantity(0.01, 'seconds')

>>> 18000.centiseconds
3.minutes
```

At `Quantity`,
use `inCentiseconds` to answer the number of centiseconds:

```
>>> 5.minutes.inCentiseconds
3000

>>> 3.hours.inCentiseconds
3 * 60 * 60 * 10
```

* * *

See also: hours, inSeconds, milliseconds, Quantity, seconds, minutes

Guides: Quantity Functions

Categories: Time, Type
