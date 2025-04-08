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

At `Time`,
answer the number of complete milliseconds in _t_:

```
>>> 5.minutes.asTime.milliseconds
300000

>>> 3.hours.asTime.milliseconds
3 * 60 * 60 * 1000
```

* * *

See also: asSeconds, hours, minutes, seconds, Time

Categories: Time, Type
