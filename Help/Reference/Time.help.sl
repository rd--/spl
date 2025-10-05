# Time

- _Time(x)_

Time is a `Trait` holding behaviours for types representing a quantity of the base unit of measure for time.
It is also a specialized constructor method for `Quantity` values.
The base unit of time in the International System of Units (SI) is the second (_s_).

```
>>> let t = Time(1);
>>> (t.isTime, t.unit, t.magnitude)
(true, 'seconds', 1)
```

* * *

See also: Frequency, Length, Mass, PlaneAngle, Quantity, SiUnit

Guides: Date and Time Functions, Quantity Functions

References:
_NIST_
[1](https://www.nist.gov/pml/special-publication-811),
_W_
[1](https://en.wikipedia.org/wiki/Time)

Categories: Unit, Trait
