# Mass

- _Mass(x)_

Mass is a `Trait` to for types that represent a measure for mass.
It is also a specialized constructor method for `Quantity` values.
The kilogram (_kg_) is the SI unit of mass.

```
>>> let m = Mass(1);
>>> (m.isMass, m.unit, m.magnitude)
(true, 'kilograms', 1)
```

* * *

See also: Angle, Frequency, Length, Quantity, SiUnit, Time

Guides: Quantity Functions

References:
_NIST_
[1](https://www.nist.gov/pml/special-publication-811),
_W_
[1](https://en.wikipedia.org/wiki/Mass)

Categories: Unit, Trait
