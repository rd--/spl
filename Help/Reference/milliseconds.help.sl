# milliseconds

- _milliseconds(t)_

At `SmallFloat`,
construct a `Quantity` value holding _t_ milliseconds:

```
>>> 5.milliseconds
Quantity(0.005, 'seconds')

>>> 180000.milliseconds
3.minutes
```

At `Quantity`,
use `inMilliseconds` to answer the number of milliseconds:

```
>>> 5.minutes.inMilliseconds
300000

>>> 3.hours.inMilliseconds
3 * 60 * 60 * 1000
```

* * *

See also: hours, inSeconds, minutes, Quantity, seconds

Guides: Quantity Functions

Categories: Time, Type
