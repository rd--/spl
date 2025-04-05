# milliseconds

- _milliseconds(t)_

Answer the number of complete milliseconds in _aDuration_,
or construct a `Quantity` value holding _aNumber_ milliseconds.

At `SmallFloat`:

```
>>> 5.milliseconds
Quantity(0.005, 'seconds')

>>> 180000.milliseconds
3.minutes
```

At `Duration`:

```
>>> 5.minutes.asDuration.milliseconds
300000

>>> 3.hours.asDuration.milliseconds
3 * 60 * 60 * 1000
```

* * *

See also: asSeconds, Duration, hours, seconds, minutes

Categories: Time, Type
