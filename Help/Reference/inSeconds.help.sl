# inSeconds

- _inSeconds(x)_

Answer a magnitude of the time value _x_ in seconds.

At `Quantity`:

```
>>> 5.minutes
Quantity(300, 'second')

>>> 5.minutes.inSeconds
300
```

At `Duration`:

```
>>> Duration(5).inSeconds
5
```

It is an error if _x_ is not a time value:

```
>>> { 5.inSeconds }.hasError
true
```

_Rationale_:
`Quantity` has asymmetrical constructors and accessors.
This avoids a confusing error if a `Quantity` is required, but a `Number` is provided,
since what was intended as the accessor (say `seconds`) acts instead as a constructor.
`inSeconds` allows the value provided to be either a `Quantity` or a `Duration`.

There are equivalent methods for:

- `PlaneAngle`, `inRadians`
- `Frequency`, `inHertz`
- `Length`, `inMetres`

* * *

See also: Duration, Frequency, Quantity, Time, inHertz, inRadians, inSeconds

Guides: Quantity Functions

References:
_Smalltalk_
5.8.2.8

Categories: Converting
