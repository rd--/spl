# hertz

- _hertz(n)_

Answer a `Quantity` representing the number _n_ in hertz.

```
>>> let f = 440.hertz;
>>> (f.isQuantity, f.magnitude, f.unit)
(true, 440, 'hertz')
```

Use `inHertz` to retreive the magnitude,
also answer the inverse of a time value:

```
>>> 44.1.kilohertz.inHertz
44100

>>> (1 / 44100).seconds.inHertz
44100
```

Quantities accept SI unit modifiers:

```
>>> 1.hertz.giga
Quantity(1000000000, 'hertz')

>>> 1.gigahertz
Quantity(1000000000, 'hertz')
```

* * *

See also: asHertz, Frequency, Quantity

Guides: Quantity Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Hertz)
[2](https://en.wikipedia.org/wiki/SI)
