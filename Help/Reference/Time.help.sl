# Time

- _Time(x)_

A `Type` representing a unit of measure for time.
The second (_s_) is the SI unit of time.

```
>>> let t = Time(1);
>>> (t.isTime, t.unit, t.magnitude)
(true, 'seconds', 1)
```

Query `Time` value:

```
>>> 3.hours.asTime.minutes
180

>>> 3.days.asTime.hours
72

>>> 3.weeks.asTime.days
21

>>> 1.siderealDays.asTime.hours
23.9345
```

* * *

See also: Angle, Frequency, Length, Mass, Quantity, SiUnit

References:
_NIST_
[1](https://www.nist.gov/pml/special-publication-811),
_W_
[1](https://en.wikipedia.org/wiki/Time)

Categories: Unit, Type
