# julianYears

- _julianYears(t)_

At `SmallFloat`,
answer a `Quantity` representing _x_ Julian years.
A Julian year is a unit of measurement of time defined as exactly 365.25 days of 86400 seconds each.

```
>>> 1.julianYears
Quantity(31557600, 'seconds')
```

At `Quantity`,
answer the magnitude of the time in Julian years:

```
>>> 365.25.days
>>> .julianYears
1
```

* * *

See also: Quantity, siderealMonths, synodicMonths

References:
_W_
[1](https://en.wikipedia.org/wiki/Julian_year_(astronomy))

Categories: Accessing, Date
