# inHertz

- _inHertz(x)_

Answer a frequency in hertz, either directly from a number, or from a `Quantity`.

```
>>> Frequency(5).inHertz
5

>>> Quantity(5, 'hertz').inHertz
5

>>> { 5.inHertz }.hasError
true
```

There are equivalent methods for:

- `PlaneAngle`, `inRadians`
- `Duration`, `inSeconds`
- `Length`, `inMetres`

* * *

See also: Duration, inHertz, inMetres, inSeconds, Frequency

Categories: Converting
