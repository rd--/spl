# Hpz2

Two zero fixed highpass.

_Hpz2(in)_

A special case fixed filter.
Implements the formula _out(i) = 0.25 * (in(i) - (2*in(i-1)) + in(i-2))_.

Compare:

```
WhiteNoise() * 0.1
```

and:

```
Hpz2(WhiteNoise()) * 0.1
```

* * *

See also: Bpz2, Brz2, Lpz2, Hpz1

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/HPZ2.html)
