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
answer the number of complete milliseconds in _t_:

```
>>> 5.minutes.milliseconds
300000

>>> 3.hours.milliseconds
3 * 60 * 60 * 1000
```

* * *

See also: asSeconds, hours, minutes, Quantity, seconds

Guides: Quantity Functions

Categories: Time, Type
