# Length

- _Length(x)_

Length is a `Trait` to for types that represent a of measure for length.
It is also a specialized constructor method for `Quantity` values.
The metre (_m_) is the SI unit of length.

```
>>> let l = Length(1);
>>> (l.isLength, l.unit, l.magnitude)
(true, 'metres', 1)
```

* * *

See also: Angle, Frequency, Mass, Quantity, SiUnit, Time

Guides: Quantity Functions

References:
_NIST_
[1](https://www.nist.gov/pml/special-publication-811),
_W_
[1](https://en.wikipedia.org/wiki/Length)

Categories: Unit, Trait
