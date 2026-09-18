# inSeconds

- _inSeconds(x)_

Answer a duration in seconds,
either directly from a number,
or from a `Duration` or a `Quantity`.

```
>>> Duration(5).inSeconds
5

>>> 5.minutes
Quantity(300, 'seconds')

>>> 5.minutes.inSeconds
300

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
- `Time`, `inSeconds`
- `Frequency`, `inHertz`
- `Length`, `inMetres`

* * *

See also: Duration, Frequency, inHertz, inRadians, inSeconds

Guides: Quantity Functions

References:
_Smalltalk_
5.8.2.8

Categories: Converting
