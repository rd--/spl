# asHertz

- _asHertz(aFrequency | aNumber)_

Answer a frequency in hertz, either directly from a number, or from a `Frequency`.

```
>>> 5.hertz.asHertz
5.hertz.hertz

>>> 5.asHertz
5

>>> 5.hertz.isFrequency
true
```

_Rationale_:
`Frequency` has symmetrical constructors and accessors.
There are equivalent methods for `Angle` (`asRadians`) and `Duration` (`asSeconds`) and `Length` (`asMetres`).

* * *

See also: asSeconds, Duration, hertz, Frequency

Categories: Converting
