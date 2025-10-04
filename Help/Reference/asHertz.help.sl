# asHertz

- _asHertz(x)_

Answer a frequency in hertz, either directly from a number, or from a `Quantity`.

```
>>> Frequency(5).asHertz
5

>>> Quantity(5, 'hertz').asHertz
5

>>> 5.asHertz
5
```

_Rationale_:
`Frequency` has symmetrical constructors and accessors.
There are equivalent methods for `PlaneAngle` (`asRadians`) and `Duration` (`asSeconds`) and `Length` (`asMetres`).

* * *

See also: asSeconds, Duration, hertz, Frequency

Categories: Converting
