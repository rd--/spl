# asSeconds

- _asSeconds(aDuration | aNumber)_

Answer a duration in seconds, either directly from a number, or from a `Duration`.

```
>>> 5.seconds.asSeconds
5.seconds.seconds

>>> 5.asSeconds
5

>>> 5.seconds.isDuration
true
```

_Rationale_:
`Duration` has symmetrical constructors and accessors.
It is a confusing error if a `Duration` is required, but a `Number` is provided,
since what was intended as the accessor (say `seconds`) acts instead as a constructor.
`asSeconds` allows the value provided to be either a `Duration`,
or a `Number` giving the duration directly in seconds.
There are equivalent methods for `Angle` (`asRadians`) and `Frequency` (`asHertz`) and `Length` (`asMetres`).

* * *

See also: asHertz, asMeters, asRadians, Duration, Frequency, seconds

References:
_Smalltalk_
5.8.2.8

Categories: Converting
