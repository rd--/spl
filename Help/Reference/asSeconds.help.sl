# asSeconds

- _asSeconds(x)_

Answer a duration in seconds, either directly from a number, or from a `Duration`.

```
>>> Duration(5).asSeconds
5

>>> 5.asSeconds
5

>>> 5.seconds
Quantity(5, 'seconds')

>>> 5.seconds.seconds
5
```

_Rationale_:
`Quantity` has symmetrical constructors and accessors.
It is a confusing error if a `Quantity` is required, but a `Number` is provided,
since what was intended as the accessor (say `seconds`) acts instead as a constructor.
`asSeconds` allows the value provided to be either a `Quantity`,
or a `Duration`,
or a `Number` giving the duration directly in seconds.
There are equivalent methods for `PlaneAngle` (`asRadians`) and `Frequency` (`asHertz`) and `Length` (`asMetres`).
Another approach would be to rename the accessor, either to _inSeconds_ or more generally _in('seconds')_.

* * *

See also: asHertz, asRadians, Duration, Frequency, seconds

Guides: Quantity Functions

References:
_Smalltalk_
5.8.2.8

Categories: Converting
