# Hpz1

Two point difference filter.

_Hpz1(in)_

A special case fixed filter.
Implements the formula _out(i) = 0.5 * (in(i) - in(i-1))_ which is a two point differentiator.

Compare:

```
WhiteNoise() * 0.1
```

and:

```
Hpz1(WhiteNoise() * 0.25)
```

* * *

See also: Lpz1, Hpz2

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/HPZ1.html)
