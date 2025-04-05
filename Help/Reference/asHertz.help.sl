# asHertz

- _asHertz(anObject)_

Answer a frequency in hertz, either directly from a number, or from a `Frequency`.

```
>>> Frequency(5).asHertz
5

>>> 5.asHertz
5

>>> 5.hertz
Quantity(5, 'hertz')
```

_Rationale_:
`Frequency` has symmetrical constructors and accessors.
There are equivalent methods for `Angle` (`asRadians`) and `Duration` (`asSeconds`) and `Length` (`asMetres`).

* * *

See also: asSeconds, Duration, hertz, Frequency

Categories: Converting
