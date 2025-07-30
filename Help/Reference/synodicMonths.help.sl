# synodicMonths

- _synodicMonths(n)_

Answer a `Quantity` of _n_ synodic months.
A synodic month is the average period of the Moon’s orbit with respect to the line joining the Sun and Earth.

At `SmallFloat` answer a `Quantity`:

```
>>> 1.synodicMonths
[
	29.days,
	12.hours,
	44.minutes,
	2.976.seconds
].sum

>>> 1.synodicMonths
Quantity(2551442.976, 'seconds')
```

* * *

See also: Duration, siderealMonths

References:
_W_
[1](https://en.wikipedia.org/wiki/Lunar_month#Synodic_month)
