# asSeconds

- _asSeconds(aDuration | aNumber)_

The method to get a duration in seconds, either directly from a number, or from a `Duration`.

_Rationale_: `Duration` has symmetrical constructors and accessors, i.e.

```
>>> 5.seconds.isDuration
true

>>> 5.seconds.seconds
5
```

It is a confusing error if a `Duration` is required, but a `Number` is provided,
since what was intended as the accessor (say `seconds`) acts instead as a constructor.

`asSeconds` allows the value provided to be either a `Duration`,
or a `Number` giving the duration directly in seconds.

There are equivalent methods for `Angle` (`asRadians`) and `Frequency` (`asHertz`) and `Length` (`asMetres`).

* * *

See also: Duration, seconds

References:
_Smalltalk_
5.8.2.8

Categories: Converting
