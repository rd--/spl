# Lpz1

- _Lpz1(in)_

Two point average filter.
A special case fixed filter.
Implements the formula:

> _out[i] = 0.5 * (in[i] + in[i - 1])_

Compare:

```
WhiteNoise() * 0.1
```

and:

```
Lpz1(WhiteNoise() * 0.1)
```

* * *

See also: Hpz1, Hpz2, Lpz2

References:
_Csound_
[1](http://csound.com/docs/manual/integ.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/LPZ1.html)

Categories: Ugen
