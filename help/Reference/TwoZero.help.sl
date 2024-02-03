# TwoZero

Two zero filter.

_TwoZero(in, freq, radius)_

A two zero filter.

- in: input signal to be processed
- freq: frequency of zero angle.
- radius: radius of zero.

Modulate frequency:

```
TwoZero(WhiteNoise() * 0.125, XLine(20, 20000, 8), 1)
```

* * *

See also: TwoPole

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/TwoZero.html)
