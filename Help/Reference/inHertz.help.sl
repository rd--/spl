# inHertz

- _inHertz(x)_

Answer a frequency in hertz from a frequency value _x_.

At `Quantity`:

```
>>> let x = Frequency(5);
>>> (x, x.inHertz)
(Quantity(5, 'hertz'), 5)

>>> let x = Time(1 / 5);
>>> (x, x.inHertz)
(Quantity(0.2, 'second'), 5)
```

It is an error if _x_ is not a time value:

```
>>> { 5.inHertz }.hasError
true
```

There are equivalent methods for:

- `PlaneAngle`, `inRadians`
- `Time`, `inSeconds`
- `Length`, `inMetres`

* * *

See also: Frequency, Time, Quantity, inMetres, inRadians, inSeconds

Guides: Quantity Functions

Categories: Converting
